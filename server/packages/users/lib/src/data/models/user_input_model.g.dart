// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInputModelImpl _$$UserInputModelImplFromJson(Map<String, dynamic> json) =>
    _$UserInputModelImpl(
      name: json['name'] as String,
      type: json['type'] as String,
      email: json['email'] as String?,
      username: json['username'] as String,
      passwordHash: json['password_hash'] as String,
    );

Map<String, dynamic> _$$UserInputModelImplToJson(
        _$UserInputModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'email': instance.email,
      'username': instance.username,
      'password_hash': instance.passwordHash,
    };
