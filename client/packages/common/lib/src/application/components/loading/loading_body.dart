import 'package:common/common.dart';

final class LoadingBody extends StatelessWidget {
  const LoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RepaintBoundary(child: CircularProgressIndicator()),
    );
  }
}
