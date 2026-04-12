import 'package:common/common.dart';
import 'package:rooms/rooms.dart';
import 'package:rooms/src/application/application.dart';
import 'package:rooms/src/domain/entities/room_input_entity.dart';

class EditRoomModalScreen extends StatefulWidget {
  const EditRoomModalScreen({
    super.key,
    required this.room,
  });

  final RoomEntity room;
  Future<RoomEntity?> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => UpdateRoomScope(
        projectId: context.read<ProjectIdController>().value!,
        roomId: room.id,
        child: UpdateRoomBlocListener(
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
  State<EditRoomModalScreen> createState() => _EditRoomModalScreenState();
}

class _EditRoomModalScreenState extends State<EditRoomModalScreen> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.room.name);
  }

  void _submit() {
    if (_nameController.text.trim().isEmpty) {
      return;
    }
    final room = RoomInputEntity(
      name: _nameController.text.trim(),
      floorId: widget.room.floorId,
      planMediaPath: widget.room.planMediaPath,
    );
    UpdateRoomScope.of(context).update(
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
                  'Редактирование комнаты',
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
                  final state = UpdateRoomScope.of(context, listen: true).state;
                  return AppFormButton.primary(
                    isLoading: state.isLoading,
                    onPressed: _submit,
                    child: const Text('Сохранить'),
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
