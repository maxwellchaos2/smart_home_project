import 'package:common/common.dart';
import 'package:floors/floors.dart';
import 'package:rooms/rooms.dart';
import 'package:rooms/src/application/application.dart';
import 'package:rooms/src/domain/entities/room_input_entity.dart';

class CreateRoomModalScreen extends StatefulWidget {
  const CreateRoomModalScreen({super.key});

  Future<RoomEntity?> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CreateRoomScope(
        projectId: context.read<ProjectIdController>().value!,
        child: CreateRoomBlocListener(
          listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (state) {
                context.navigator.popForced(state.data);
                return null;
              }),
          child: this,
        ),
      ),
    );
  }

  @override
  State<CreateRoomModalScreen> createState() => _CreateRoomModalScreenState();
}

class _CreateRoomModalScreenState extends State<CreateRoomModalScreen> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: '');
  }

  void _submit() {
    if (_nameController.text.trim().isEmpty) {
      return;
    }
    final room = RoomInputEntity(
      name: _nameController.text.trim(),
      floorId: FloorsScope.of(context).state.data!.first.id,
      planMediaPath: null,
    );
    CreateRoomScope.of(context).create(
      input: room,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusWatcher(
      child: SafeArea(
        child: Padding(
          padding: AppPaddings.horizontal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: AppPaddings.horizontal,
                child: Text(
                  'Добавление комнаты',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ).reverseMerge(context.textTheme.titleMedium),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Название комнаты',
                  style: context.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  hintText: 'Введите название комнаты',
                ),
              ),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  final state = CreateRoomScope.of(context, listen: true).state;
                  return AppFormButton.primary(
                    isLoading: state.isLoading,
                    onPressed: _submit,
                    child: const Text('Добавить'),
                  );
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.viewInsetsOf(context).bottom + 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
