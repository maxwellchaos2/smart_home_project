import 'package:common/common.dart';

final class ProdAppConfig implements IAppConfig {
  @override
  String get baseUrl => "https://api.smart-home-pnz.ru/";

  @override
  String get apiUrl => "${baseUrl}api/";

  @override
  String get wsUrl => "wss://api.smart-home-pnz.ru/ws";

  @override
  String get title => 'Умный дом';
}

final class DevAppConfig implements IAppConfig {
  @override
  String get baseUrl => "http://localhost:8080/";

  @override
  String get apiUrl => "${baseUrl}api/";

  @override
  String get wsUrl => "ws://localhost:8080/ws";

  @override
  String get title => 'Умный дом';
}
