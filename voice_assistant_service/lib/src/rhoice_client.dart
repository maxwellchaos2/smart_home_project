import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

// docker run -d --name rhvoice-rest -p 2800:8080 aculeasis/rhvoice-rest
// http://localhost:2800/say?text=Привет&voice=aleksandr&format=wav&volume=100

class RhvoiceClient {
  final String url;
  final HttpClient _httpClient = HttpClient();

  RhvoiceClient(this.url);

  Stream<Uint8List> synthesize(
    String text, {
    String voice = 'artemiy',
    String format = 'wav',
    int volume = 100,
    int chunkSize = 4096,
  }) async* {
    try {
      final uri = Uri.parse('$url/say').replace(queryParameters: {
        'text': text,
        'voice': voice,
        'format': format,
        'volume': volume.toString(),
      });

      print("🎤 Синтезирую: '$text' (голос: $voice) URL: $uri");

      final request = await _httpClient.getUrl(uri);
      final response = await request.close();

      if (response.statusCode != 200) {
        print("❌ Ошибка синтеза речи: HTTP ${response.statusCode}");
        throw Exception("❌ Ошибка синтеза речи: ${response.statusCode}");
      }

      print("✅ Начинаю потоковую передачу аудио...");

      List<int> buffer = [];

      await for (final chunk in response) {
        buffer.addAll(chunk);

        // Отдаем данные чанками
        while (buffer.length >= chunkSize) {
          yield Uint8List.fromList(buffer.take(chunkSize).toList());
          buffer = buffer.skip(chunkSize).toList();
        }
      }

      // Отдаем остаток буфера
      if (buffer.isNotEmpty) {
        yield Uint8List.fromList(buffer);
      }

      print("✅ Синтез завершен");
    } on SocketException catch (e) {
      print("❌ RHVoice недоступен по адресу $url: $e");
      print("⚠️  Проверьте, что RHVoice сервер запущен и доступен");
      // Не пробрасываем ошибку дальше - просто логируем
    } catch (e) {
      print("❌ Ошибка при синтезе речи: $e");
      // Не пробрасываем ошибку дальше - просто логируем
    }
  }

  // consolidateHttpClientResponseBytes
  Future<Uint8List> consolidateHttpClientResponseBytes(
      HttpClientResponse response) {
    final completer = Completer<Uint8List>();
    final contents = <int>[];
    response.listen(
      (data) => contents.addAll(data),
      onDone: () => completer.complete(Uint8List.fromList(contents)),
      onError: (e) => completer.completeError(e),
      cancelOnError: true,
    );
    return completer.future;
  }
}
