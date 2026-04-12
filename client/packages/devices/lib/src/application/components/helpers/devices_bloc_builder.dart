import 'package:common/common.dart';
import 'package:devices/src/domain/domain.dart';
import 'package:flutter/foundation.dart';

class DevicesBlocBuilder extends StatelessWidget {
  const DevicesBlocBuilder({
    super.key,
    required this.builder,
    this.filter,
  });

  final Widget Function(BuildContext context, List<DeviceEntity> data) builder;
  final bool Function(DeviceEntity device)? filter;

  @override
  Widget build(BuildContext context) {
    final filter = this.filter ?? (_) => true;
    return BlocBuilder<DevicesBloc, DevicesState>(
      buildWhen: (previous, current) => !listEquals(
        previous.data!.where(filter).toList(),
        current.data!.where(filter).toList(),
      ),
      builder: (context, state) {
        final data = state.data!.where(filter).toList();
        return builder(context, data);
      },
    );
  }
}
