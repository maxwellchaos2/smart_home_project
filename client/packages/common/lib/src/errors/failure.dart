import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure implements Exception {
  const Failure._();

  const factory Failure.unknown({
    @Default("Unknown error") String message,
    @Default('unknown') String code,
  }) = _UnknownFailure;
  const factory Failure.api({
    String? message,
    @Default('api-error') String code,
  }) = _ApiFailure;
  const factory Failure.localStorage({
    String? message,
    @Default('locale-storage-error') String code,
  }) = _LocalStorageFailure;
  const factory Failure.platform({
    String? message,
    @Default('platform-error') String code,
  }) = _PlatfromFailure;

  const factory Failure.noInternet({
    @Default('No internet connection') String message,
    @Default('no-internet') String code,
  }) = _NoInternetFailure;

  @override
  String toString() {
    return "$runtimeType: $code";
  }
}
