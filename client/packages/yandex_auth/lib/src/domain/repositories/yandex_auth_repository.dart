abstract interface class IYandexAuthRepository {
  Future<void> signIn({
    required String code,
  });

  Future<void> updateYandexDevices({
    required int projectId,
  });

  Future<void> signOut();
}
