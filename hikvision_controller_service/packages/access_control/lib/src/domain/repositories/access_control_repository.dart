abstract interface class IAccessControlRepository {
  Future<bool> openDoor({
    required int doorId,
  });

  Future<bool> closeDoor({
    required int doorId,
  });
}
