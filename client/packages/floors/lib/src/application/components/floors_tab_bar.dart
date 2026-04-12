import 'package:common/common.dart';
import 'package:floors/src/application/application.dart';

class FloorsTabBar extends StatelessWidget {
  const FloorsTabBar({
    super.key,
    required this.controller,
  });

  final FloorsTabController controller;
  @override
  Widget build(BuildContext context) {
    final floors = FloorsScope.of(context, listen: true).state.data!;
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
          for (final floor in floors) Tab(text: floor.name),
        ],
      ),
    );
  }
}
