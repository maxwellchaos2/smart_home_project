import 'dart:math' as math;
import 'dart:typed_data';

@Deprecated('')
class AudioProcessor {
  // Параметры обработки звука
  final int sampleRate;
  final double noiseGateThreshold;
  final double amplificationFactor;
  final int smoothingWindowSize;
  final bool enableNoiseReduction;
  final bool enableNormalization;
  final bool enableSmoothing;

  // Внутренние буферы для обработки
  final List<double> _noiseProfile = [];
  bool _noiseProfileBuilt = false;
  int _silenceCounter = 0;
  final List<double> _previousSamples = [];
  int _processedChunks = 0;

  AudioProcessor({
    this.sampleRate = 16000,
    this.noiseGateThreshold = 0.015, // Порог шумоподавления
    this.amplificationFactor = 2.5, // Коэффициент усиления
    this.smoothingWindowSize = 5, // Размер окна сглаживания
    this.enableNoiseReduction = true, // Включить шумоподавление
    this.enableNormalization = true, // Включить нормализацию
    this.enableSmoothing = true, // Включить сглаживание
  }) {
    print("🔧 AudioProcessor инициализирован:");
    print("   📊 Sample Rate: ${sampleRate}Hz");
    print("   🔇 Noise Gate: $noiseGateThreshold");
    print("   🔊 Amplification: ${amplificationFactor}x");
    print("   📈 Smoothing: $smoothingWindowSize");
    print("   🎛️  Noise Reduction: $enableNoiseReduction");
    print("   ⚖️  Normalization: $enableNormalization");
    print("   🌊 Smoothing: $enableSmoothing");
  }

  /// Основной метод обработки аудио chunk
  Uint8List processAudio(Uint8List rawAudioData) {
    _processedChunks++;

    // 1. Конвертируем байты в семплы
    List<double> samples = _bytesToSamples(rawAudioData);

    if (samples.isEmpty) return rawAudioData;

    // 2. Строим профиль шума из первых chunks
    if (!_noiseProfileBuilt && _processedChunks <= 5 && enableNoiseReduction) {
      _buildNoiseProfile(samples);
    }

    // 3. Применяем обработку по очереди
    if (enableNoiseReduction) {
      samples = _removeNoise(samples);
    }

    if (enableNormalization) {
      samples = _amplifyAndNormalize(samples);
    }

    samples = _applyNoiseGate(samples);

    if (enableSmoothing) {
      samples = _smoothSignal(samples);
    }

    // 4. Анализируем качество обработки
    if (_processedChunks % 50 == 0) {
      // Каждые 5 секунд
      _logProcessingStats(samples, rawAudioData.length);
    }

    // 5. Конвертируем обратно в байты
    return _samplesToBytes(samples);
  }

  /// Конвертация байтов в нормализованные семплы (-1.0 до 1.0)
  List<double> _bytesToSamples(Uint8List bytes) {
    List<double> samples = [];

    for (int i = 0; i < bytes.length - 1; i += 2) {
      // 16-bit little endian -> signed integer
      int sample16 = bytes[i] | (bytes[i + 1] << 8);
      if (sample16 > 32767) sample16 -= 65536; // Знаковое число

      // Нормализуем в диапазон -1.0 до 1.0
      double normalized = sample16 / 32768.0;
      samples.add(normalized);
    }

    return samples;
  }

  /// Конвертация семплов обратно в байты
  Uint8List _samplesToBytes(List<double> samples) {
    Uint8List bytes = Uint8List(samples.length * 2);

    for (int i = 0; i < samples.length; i++) {
      // Ограничиваем диапазон и конвертируем в 16-bit
      double clampedSample = samples[i].clamp(-1.0, 1.0);
      int sample16 = (clampedSample * 32767).round();

      // Конвертируем в unsigned для байтового представления
      if (sample16 < 0) sample16 += 65536;

      bytes[i * 2] = sample16 & 0xFF; // Младший байт
      bytes[i * 2 + 1] = (sample16 >> 8) & 0xFF; // Старший байт
    }

    return bytes;
  }

  /// Построение профиля шума из первых chunks
  void _buildNoiseProfile(List<double> samples) {
    _noiseProfile.addAll(samples);

    if (_processedChunks == 5) {
      // Анализируем первые 5 chunks как профиль шума
      _noiseProfileBuilt = true;
      print("✅ Профиль шума построен из ${_noiseProfile.length} семплов");

      // Вычисляем средний уровень шума
      double avgNoise =
          _noiseProfile.map((s) => s.abs()).reduce((a, b) => a + b) /
              _noiseProfile.length;
      print("📊 Средний уровень шума: ${(avgNoise * 100).toStringAsFixed(1)}%");
    }
  }

  /// Спектральное вычитание шума
  List<double> _removeNoise(List<double> samples) {
    if (!_noiseProfileBuilt || _noiseProfile.isEmpty) return samples;

    List<double> cleanSamples = [];

    for (int i = 0; i < samples.length; i++) {
      double originalSample = samples[i];

      // Берем среднее значение шума для вычитания
      double noiseLevel = _noiseProfile.isNotEmpty
          ? _noiseProfile[i % _noiseProfile.length] *
              0.4 // Вычитаем 40% от профиля шума
          : 0.0;

      double cleanSample = originalSample - noiseLevel;

      // Дополнительно применяем адаптивное шумоподавление
      if (originalSample.abs() < noiseGateThreshold * 2) {
        cleanSample *= 0.3; // Сильно ослабляем предполагаемый шум
      }

      cleanSamples.add(cleanSample);
    }

    return cleanSamples;
  }

  /// Нормализация и усиление сигнала
  List<double> _amplifyAndNormalize(List<double> samples) {
    if (samples.isEmpty) return samples;

    // Находим пиковую амплитуду
    double maxAmplitude = samples.map((s) => s.abs()).reduce(math.max);

    if (maxAmplitude < 0.001) {
      // Сигнал слишком тихий - возможно тишина
      return samples.map((s) => s * 0.1).toList(); // Сильно ослабляем
    }

    // Вычисляем безопасный коэффициент усиления
    double safeAmplification = math.min(amplificationFactor,
        0.85 / maxAmplitude // Не даем превысить 85% от максимума
        );

    return samples.map((s) => s * safeAmplification).toList();
  }

  /// Noise Gate - подавление сигналов ниже порога
  List<double> _applyNoiseGate(List<double> samples) {
    List<double> gatedSamples = [];

    for (double sample in samples) {
      double absSample = sample.abs();

      if (absSample > noiseGateThreshold) {
        // Сигнал выше порога - пропускаем
        gatedSamples.add(sample);
        _silenceCounter = 0;
      } else {
        // Сигнал ниже порога - применяем затухание
        _silenceCounter++;

        // Постепенное затухание для избежания резких обрывов
        double fadeFactor = math.max(0.0, 1.0 - (_silenceCounter / 15.0));
        gatedSamples.add(sample * fadeFactor);
      }
    }

    return gatedSamples;
  }

  /// Сглаживание сигнала скользящим средним
  List<double> _smoothSignal(List<double> samples) {
    if (samples.length < smoothingWindowSize * 2) return samples;

    List<double> smoothed = List.from(samples);
    int halfWindow = smoothingWindowSize ~/ 2;

    for (int i = halfWindow; i < samples.length - halfWindow; i++) {
      double sum = 0.0;
      int count = 0;

      // Вычисляем взвешенное среднее в окне
      for (int j = -halfWindow; j <= halfWindow; j++) {
        int index = i + j;
        if (index >= 0 && index < samples.length) {
          // Центральные семплы имеют больший вес
          double weight = 1.0 - (j.abs() / (halfWindow + 1));
          sum += samples[index] * weight;
          count++;
        }
      }

      if (count > 0) {
        smoothed[i] = sum / count;
      }
    }

    return smoothed;
  }

  /// Логирование статистики обработки
  void _logProcessingStats(
      List<double> processedSamples, int originalBytesLength) {
    double maxAmplitude = processedSamples.map((s) => s.abs()).reduce(math.max);
    double avgAmplitude =
        processedSamples.map((s) => s.abs()).reduce((a, b) => a + b) /
            processedSamples.length;
    double rms = math.sqrt(
        processedSamples.map((s) => s * s).reduce((a, b) => a + b) /
            processedSamples.length);

    print("📊 Статистика обработки (chunk #$_processedChunks):");
    print(
        "   📏 Размер: $originalBytesLength байт → ${processedSamples.length} семплов");
    print("   🔊 Пик: ${(maxAmplitude * 100).toStringAsFixed(1)}%");
    print("   📈 Среднее: ${(avgAmplitude * 100).toStringAsFixed(1)}%");
    print("   ⚡ RMS: ${(rms * 100).toStringAsFixed(1)}%");
  }

  /// Сброс внутреннего состояния
  void reset() {
    _noiseProfile.clear();
    _noiseProfileBuilt = false;
    _silenceCounter = 0;
    _previousSamples.clear();
    _processedChunks = 0;
    print("🔄 AudioProcessor сброшен");
  }
}
