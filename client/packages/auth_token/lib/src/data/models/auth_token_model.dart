import 'package:common/common.dart';

part 'auth_token_model.freezed.dart';
part 'auth_token_model.g.dart';

@Freezed(fromJson: true, toJson: true)
sealed class AuthTokenModel with _$AuthTokenModel {
  const AuthTokenModel._();

  const factory AuthTokenModel({
    required String token,
    required String? refreshToken,
  }) = _AuthTokenModel;

  factory AuthTokenModel.fromJson(Map<String, Object?> json) =>
      _$AuthTokenModelFromJson(json);

  @override
  Map<String, Object?> toJson();
}
