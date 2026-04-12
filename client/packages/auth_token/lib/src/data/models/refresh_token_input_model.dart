import 'package:common/common.dart';

part 'refresh_token_input_model.freezed.dart';
part 'refresh_token_input_model.g.dart';

@Freezed(toJson: true)
sealed class RefreshTokenInputModel with _$RefreshTokenInputModel {
  const RefreshTokenInputModel._();

  const factory RefreshTokenInputModel({
    required String refreshToken,
  }) = _RefreshTokenInputModel;

  @override
  Map<String, dynamic> toJson();
}
