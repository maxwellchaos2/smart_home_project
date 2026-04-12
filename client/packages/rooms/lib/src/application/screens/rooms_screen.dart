import 'package:common/common.dart';
import 'package:rooms/src/application/application.dart';

class RoomsScreen extends StatelessWidget with ScreenMixin {
  const RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rooms = RoomsScope.of(context, listen: true).state.data!;
    return Scaffold(
      appBar: AppBar(title: const Text('Комнаты')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CreateRoomModalScreen().show(context);
        },
        child: const Icon(Icons.add),
      ),
      body: rooms.isEmpty
          ? Center(
              child: Text(
                'Нет комнат.\nНажмите кнопку "+" чтобы добавить.',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge,
              ),
            )
          : CustomScrollView(
              controller: ModalScrollController.of(context),
              slivers: [
                SliverPadding(
                  padding: AppPaddings.horizontal,
                  sliver: SliverReorderableList(
                    onReorder: (_, __) {},
                    itemCount: rooms.length,
                    proxyDecorator: (child, index, animation) {
                      return Material(
                        elevation: 6,
                        color: Colors.transparent,
                        shadowColor: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                        child: child,
                      );
                    },
                    itemBuilder: (context, index) {
                      final room = rooms[index];
                      return MultiProvider(
                        key: ValueKey(room.id),
                        providers: [
                          DeleteRoomScope(
                            projectId:
                                context.read<ProjectIdController>().value!,
                            roomId: room.id,
                          ),
                        ],
                        child: Builder(builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ).copyWith(left: 16),
                              decoration: BoxDecoration(
                                color: context.theme.colorScheme.surface,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.drag_handle),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(room.name),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      EditRoomModalScreen(room: room)
                                          .show(context);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    color: context.theme.colorScheme.error,
                                    onPressed: () async {
                                      final confirmed = await showDialog<bool>(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Удалить комнату?'),
                                            content: Text(
                                                'Вы уверены, что хотите удалить комнату "${room.name}"?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(false);
                                                },
                                                child: Text('Отмена'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                                child: Text('Удалить'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      if (confirmed == true) {
                                        // ignore: use_build_context_synchronously
                                        DeleteRoomScope.of(context).delete();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
