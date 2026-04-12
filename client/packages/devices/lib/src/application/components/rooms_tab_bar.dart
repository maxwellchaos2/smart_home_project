import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:rooms/rooms.dart';

class RoomsTabBar extends StatelessWidget {
  const RoomsTabBar({
    super.key,
    required this.controller,
  });

  final RoomsTabController controller;
  @override
  Widget build(BuildContext context) {
    final rooms = RoomsScope.of(context, listen: true).state.data!;
    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: controller,
        isScrollable: true,
        dividerHeight: 0,
        tabAlignment: TabAlignment.start,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide.none,
        ),
        labelStyle: TextStyle(
          color: context.theme.colorScheme.onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
        unselectedLabelColor:
            context.theme.colorScheme.onSurface.withValues(alpha: .5),
        tabs: [
          const Tab(text: 'Все'),
          for (final room in rooms) Tab(text: room.name),
        ],
      ),
    );
  }
}
