import 'dart:convert';

import 'package:crypto/crypto.dart';

import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class UserInputMapper {
  static UserInputModel toModel({required UserInputEntity from}) {
    return UserInputModel(
      name: from.name,
      type: switch (from.type) {
        UserType.admin => 'admin',
        UserType.user => 'user',
      },
      email: from.email,
      username: from.username,
      passwordHash: sha256.convert(utf8.encode(from.password)).toString(),
    );
  }
}
