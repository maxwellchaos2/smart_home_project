import 'package:common/common.dart';

final class EmptyScreen extends StatelessWidget with ScreenMixin {
  const EmptyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Empty screen'),
      ),
    );
  }
}
