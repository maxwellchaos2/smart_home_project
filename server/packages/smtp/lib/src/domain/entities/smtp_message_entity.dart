import 'package:common/common.dart';

part 'smtp_message_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class SmtpMessageEntity with _$SmtpMessageEntity {
  const SmtpMessageEntity._();

  const factory SmtpMessageEntity({
    required String? fromName,
    required List<String> recipients,
    required String subject,
    required String text,
  }) = _SmtpMessageEntity;
}
