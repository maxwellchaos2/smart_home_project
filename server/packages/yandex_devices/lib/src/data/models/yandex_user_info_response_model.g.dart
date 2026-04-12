// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yandex_user_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YandexUserInfoResponseModel _$YandexUserInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    _YandexUserInfoResponseModel(
      devices: (json['devices'] as List<dynamic>)
          .map((e) => YandexDeviceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
