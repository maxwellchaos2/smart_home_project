// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smtp_message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SmtpMessageEntity {
  String? get fromName => throw _privateConstructorUsedError;
  List<String> get recipients => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SmtpMessageEntityCopyWith<SmtpMessageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmtpMessageEntityCopyWith<$Res> {
  factory $SmtpMessageEntityCopyWith(
          SmtpMessageEntity value, $Res Function(SmtpMessageEntity) then) =
      _$SmtpMessageEntityCopyWithImpl<$Res, SmtpMessageEntity>;
  @useResult
  $Res call(
      {String? fromName, List<String> recipients, String subject, String text});
}

/// @nodoc
class _$SmtpMessageEntityCopyWithImpl<$Res, $Val extends SmtpMessageEntity>
    implements $SmtpMessageEntityCopyWith<$Res> {
  _$SmtpMessageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromName = freezed,
    Object? recipients = null,
    Object? subject = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      fromName: freezed == fromName
          ? _value.fromName
          : fromName // ignore: cast_nullable_to_non_nullable
              as String?,
      recipients: null == recipients
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmtpMessageEntityImplCopyWith<$Res>
    implements $SmtpMessageEntityCopyWith<$Res> {
  factory _$$SmtpMessageEntityImplCopyWith(_$SmtpMessageEntityImpl value,
          $Res Function(_$SmtpMessageEntityImpl) then) =
      __$$SmtpMessageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? fromName, List<String> recipients, String subject, String text});
}

/// @nodoc
class __$$SmtpMessageEntityImplCopyWithImpl<$Res>
    extends _$SmtpMessageEntityCopyWithImpl<$Res, _$SmtpMessageEntityImpl>
    implements _$$SmtpMessageEntityImplCopyWith<$Res> {
  __$$SmtpMessageEntityImplCopyWithImpl(_$SmtpMessageEntityImpl _value,
      $Res Function(_$SmtpMessageEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromName = freezed,
    Object? recipients = null,
    Object? subject = null,
    Object? text = null,
  }) {
    return _then(_$SmtpMessageEntityImpl(
      fromName: freezed == fromName
          ? _value.fromName
          : fromName // ignore: cast_nullable_to_non_nullable
              as String?,
      recipients: null == recipients
          ? _value._recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SmtpMessageEntityImpl extends _SmtpMessageEntity {
  const _$SmtpMessageEntityImpl(
      {required this.fromName,
      required final List<String> recipients,
      required this.subject,
      required this.text})
      : _recipients = recipients,
        super._();

  @override
  final String? fromName;
  final List<String> _recipients;
  @override
  List<String> get recipients {
    if (_recipients is EqualUnmodifiableListView) return _recipients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipients);
  }

  @override
  final String subject;
  @override
  final String text;

  @override
  String toString() {
    return 'SmtpMessageEntity(fromName: $fromName, recipients: $recipients, subject: $subject, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmtpMessageEntityImpl &&
            (identical(other.fromName, fromName) ||
                other.fromName == fromName) &&
            const DeepCollectionEquality()
                .equals(other._recipients, _recipients) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fromName,
      const DeepCollectionEquality().hash(_recipients), subject, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SmtpMessageEntityImplCopyWith<_$SmtpMessageEntityImpl> get copyWith =>
      __$$SmtpMessageEntityImplCopyWithImpl<_$SmtpMessageEntityImpl>(
          this, _$identity);
}

abstract class _SmtpMessageEntity extends SmtpMessageEntity {
  const factory _SmtpMessageEntity(
      {required final String? fromName,
      required final List<String> recipients,
      required final String subject,
      required final String text}) = _$SmtpMessageEntityImpl;
  const _SmtpMessageEntity._() : super._();

  @override
  String? get fromName;
  @override
  List<String> get recipients;
  @override
  String get subject;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$SmtpMessageEntityImplCopyWith<_$SmtpMessageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
