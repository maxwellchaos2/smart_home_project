import 'package:xml/xml.dart';

/// Модель для парсинга XML ответа поиска записей Hikvision
class RecordingSearchModel {
  final String searchId;
  final bool responseStatus;
  final String responseStatusString;
  final int numOfMatches;
  final List<RecordingMatchItemModel> matchList;

  RecordingSearchModel({
    required this.searchId,
    required this.responseStatus,
    required this.responseStatusString,
    required this.numOfMatches,
    required this.matchList,
  });

  factory RecordingSearchModel.fromXml(String xmlString) {
    final document = XmlDocument.parse(xmlString);
    final root = document.findElements('CMSearchResult').first;

    // Безопасно извлекаем matchList
    final matchListElement = root.findElements('matchList');
    final List<RecordingMatchItemModel> matchList;

    if (matchListElement.isEmpty) {
      matchList = [];
    } else {
      final searchMatchItems =
          matchListElement.first.findElements('searchMatchItem');
      matchList = searchMatchItems
          .map((e) => RecordingMatchItemModel.fromXml(e))
          .toList();
    }

    return RecordingSearchModel(
      searchId: root.findElements('searchID').first.innerText,
      responseStatus:
          root.findElements('responseStatus').first.innerText == 'true',
      responseStatusString:
          root.findElements('responseStatusStrg').first.innerText,
      numOfMatches:
          int.parse(root.findElements('numOfMatches').first.innerText),
      matchList: matchList,
    );
  }
}

/// Модель отдельной записи из результатов поиска
class RecordingMatchItemModel {
  final String sourceId;
  final String trackId;
  final DateTime startTime;
  final DateTime endTime;
  final String contentType;
  final String codecType;
  final String playbackUrl;
  final int? size;

  RecordingMatchItemModel({
    required this.sourceId,
    required this.trackId,
    required this.startTime,
    required this.endTime,
    required this.contentType,
    required this.codecType,
    required this.playbackUrl,
    this.size,
  });

  factory RecordingMatchItemModel.fromXml(XmlElement element) {
    final timeSpan = element.findElements('timeSpan').first;
    final mediaSegment = element.findElements('mediaSegmentDescriptor').first;

    // Парсим playbackURI и извлекаем size из параметров если есть
    final playbackUri =
        mediaSegment.findElements('playbackURI').first.innerText;
    int? extractedSize;
    final sizeMatch = RegExp(r'size=(\d+)').firstMatch(playbackUri);
    if (sizeMatch != null) {
      extractedSize = int.tryParse(sizeMatch.group(1) ?? '');
    }

    return RecordingMatchItemModel(
      sourceId: element.findElements('sourceID').first.innerText,
      trackId: element.findElements('trackID').first.innerText,
      // Парсим UTC время и конвертируем в локальное
      startTime: DateTime.parse(
        timeSpan
            .findElements('startTime')
            .first
            .innerText
            .replaceFirst('Z', ''),
      ),
      endTime: DateTime.parse(
        timeSpan.findElements('endTime').first.innerText.replaceFirst('Z', ''),
      ),
      contentType: mediaSegment.findElements('contentType').first.innerText,
      codecType: mediaSegment.findElements('codecType').first.innerText,
      playbackUrl: playbackUri,
      size: extractedSize,
    );
  }
}

/// Модель для создания XML запроса поиска записей
class RecordingSearchRequestModel {
  final String trackId;
  final DateTime startTime;
  final DateTime endTime;
  final int maxResults;
  final int searchResultPosition;

  RecordingSearchRequestModel({
    required this.trackId,
    required this.startTime,
    required this.endTime,
    this.maxResults = 100,
    this.searchResultPosition = 0,
  });

  String toXml() {
    // Используем статичный searchID как в примере
    const searchId = 'CB71A7BD-C550-0001-30AA-1767D180B1E0';

    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0" encoding="utf-8"');
    builder.element('CMSearchDescription', nest: () {
      builder.element('searchID', nest: searchId);
      builder.element('trackList', nest: () {
        builder.element('trackID', nest: trackId);
      });
      builder.element('timeSpanList', nest: () {
        builder.element('timeSpan', nest: () {
          builder.element('startTime', nest: _formatDateTime(startTime));
          builder.element('endTime', nest: _formatDateTime(endTime));
        });
      });
      builder.element('maxResults', nest: maxResults.toString());
      builder.element('searchResultPostion',
          nest: searchResultPosition.toString());
      builder.element('metadataList', nest: () {
        builder.element('metadataDescriptor',
            nest: '//recordType.meta.std-cgi.com');
      });
    });

    final xmlDoc = builder.buildDocument();
    return xmlDoc.toXmlString(pretty: false, indent: '');
  }

  String _formatDateTime(DateTime dateTime) {
    // Формат: 2025-11-23T00:00:00Z
    final year = dateTime.year.toString().padLeft(4, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final day = dateTime.day.toString().padLeft(2, '0');
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final second = dateTime.second.toString().padLeft(2, '0');

    return '$year-$month-${day}T$hour:$minute:${second}Z';
  }
}
