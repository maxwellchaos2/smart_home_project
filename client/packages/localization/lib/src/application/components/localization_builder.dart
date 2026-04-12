import 'package:common/common.dart';

import '../../domain/domain.dart';

final class LocalizationBuilder extends StatelessWidget {
  const LocalizationBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, Locale? locale) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      buildWhen: (previous, current) => previous.data != current.data,
      builder: (context, state) {
        return builder(
          context,
          switch (state.data) {
            LocaleEntity localeEntity =>
              Locale(localeEntity.languageCode, localeEntity.countryCode),
            _ => null,
          },
        );
      },
    );
  }
}
