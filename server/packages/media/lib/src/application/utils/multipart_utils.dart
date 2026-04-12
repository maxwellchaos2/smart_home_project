import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:shelf/shelf.dart';
import 'package:shelf_multipart/shelf_multipart.dart';
import 'package:uuid/uuid.dart';

class MultipartUtils {
  static Future<String> saveFileFromMultipart(Multipart part,
      {String? filename, String? extension, required String folder}) async {
    final fileBytes = await part.readBytes();

    final filename_ = filename ?? '${Uuid().v4()}.$extension';

    final filePath = p.joinAll(['uploads', folder, filename_]);

    final file = File(filePath);
    await file.create(recursive: true);

    await file.writeAsBytes(fileBytes);

    return filePath;
  }

  static Future<({List<String> files, dynamic data})> filesAndDataFromMultipart(
    Request request, {
    String? extension,
    List<String> fileFieldNames = const ['file'],
    required String folder,
  }) async {
    final List<String> filePaths = [];
    Map<String, dynamic>? data;

    if (request.multipart() case var multipart?) {
      // Iterate over parts making up this request:
      await for (final part in multipart.parts) {
        final fieldName = extractName(part.headers['Content-Disposition']!)!;
        if (fileFieldNames.contains(fieldName)) {
          filePaths.add(await saveFileFromMultipart(
            part,
            extension: extension,
            folder: folder,
          ));
        } else if (fieldName == 'data') {
          final content = await part.readString();
          data = jsonDecode(content);
        }
      }
    }
    if (data == null) {
      throw Exception('Data not found in multipart request');
    }

    return (files: filePaths, data: data);
  }

  static String? extractName(String contentDisposition) {
    // Regex для извлечения имени файла из Content-Disposition
    final regex = RegExp(r'name="([^"]+)"');
    final match = regex.firstMatch(contentDisposition);
    return match?.group(1);
  }
}
