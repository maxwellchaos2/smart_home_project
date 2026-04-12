import 'package:shelf/shelf.dart';
import 'package:users/src/domain/domain.dart';

bool checkRequestUserType(Request request, {required UserType userType}) {
  // Получаем информацию о текущем пользователе из контекста
  final currentUser = request.context['currentUser'] as UserEntity?;

  // Проверяем, является ли текущий пользователь администратором
  if (currentUser == null || currentUser.type != userType) {
    return false;
  }
  return true;
}

bool checkRequestIsAdmin(Request request) {
  return checkRequestUserType(request, userType: UserType.admin);
}
