part of 'user_bloc.dart';

@freezed
sealed class UserState with _$UserState {
  const UserState._();
  const factory UserState.initial({UserEntity? data}) = _Initial;
  const factory UserState.loading({UserEntity? data}) = _Loading;
  const factory UserState.failure(
      {UserEntity? data,
      @Default(Failure.unknown()) Failure failure}) = _Failure;
  const factory UserState.success({required UserEntity data}) = _Success;

  bool get hasData => data != null;
  bool get isLoading => maybeMap(orElse: () => false, loading: (_) => true);
}
