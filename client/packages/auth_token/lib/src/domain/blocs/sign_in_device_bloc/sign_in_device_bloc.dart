import 'package:common/common.dart';
import '../../domain.dart';

part 'sign_in_device_event.dart';
part 'sign_in_device_state.dart';
part 'sign_in_device_bloc.freezed.dart';

final class SignInDeviceBloc
    extends Bloc<SignInDeviceEvent, SignInDeviceState> {
  final IAuthTokenRepository _repository;

  SignInDeviceBloc({
    required IAuthTokenRepository repository,
  })  : _repository = repository,
        super(const SignInDeviceState.initial()) {
    on<SignInDeviceEvent>(
      (event, emit) => event.map(
        signIn: (event) => _signIn(event, emit),
      ),
    );
  }

  Future<void> _signIn(_SignIn event, Emitter<SignInDeviceState> emit) =>
      emit.load(state, () async {
        final data = await _repository.signInDevice(
          data: event.input,
        );
        emit(SignInDeviceState.success(data: data));
      });
}

extension on Emitter<SignInDeviceState> {
  Future<void> load(
      SignInDeviceState state, Future<void> Function() func) async {
    try {
      call(const SignInDeviceState.loading());
      await func();
    } on Failure catch (e) {
      call(SignInDeviceState.failure(failure: e));
    } on Object {
      call(const SignInDeviceState.failure());
      rethrow;
    }
  }
}
