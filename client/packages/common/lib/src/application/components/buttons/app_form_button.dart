// ignore_for_file: unused_element

import 'package:common/common.dart';
import 'package:themes/themes.dart';

enum AppFormButtonType {
  primary,
  secondary,
  outlined,
}

final class AppFormButton<T> extends StatelessWidget {
  const AppFormButton.primary({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.style,
    this.focusNode,
    this.autofocus = false,
    required this.child,
    this.isLoading = false,
  }) : type = AppFormButtonType.primary;

  const AppFormButton.secondary({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.style,
    this.focusNode,
    this.autofocus = false,
    required this.child,
    this.isLoading = false,
  }) : type = AppFormButtonType.secondary;

  const AppFormButton.outlined({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.style,
    this.focusNode,
    this.autofocus = false,
    required this.child,
    this.isLoading = false,
  }) : type = AppFormButtonType.outlined;

  final void Function()? onPressed;
  final void Function()? onLongPress;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget child;
  final bool isLoading;
  final AppFormButtonType type;

  Color getForegroundColor(BuildContext context, ButtonStyle? buttonStyle) {
    return buttonStyle?.foregroundColor?.resolve({WidgetState.selected}) ??
        switch (type) {
          AppFormButtonType.primary => context.theme.colorScheme.onPrimary,
          AppFormButtonType.secondary => context.theme.colorScheme.onSecondary,
          AppFormButtonType.outlined => context.theme.colorScheme.primary,
        };
  }

  @override
  Widget build(BuildContext context) {
    final buttonStyle = style ?? _getThemeStyle(context, type);
    final foregroundColor = getForegroundColor(context, buttonStyle);
    return IgnorePointer(
      ignoring: isLoading,
      child: _AppFormButton(
        type: type,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: buttonStyle,
        focusNode: focusNode,
        autofocus: autofocus,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          child: isLoading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CircularProgressIndicator(
                      color: foregroundColor,
                    ),
                  ),
                )
              : child,
        ),
      ),
    );
  }
}

class _AppFormButton extends ButtonStyleButton {
  const _AppFormButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    required super.child,
    required this.type,
  });

  final AppFormButtonType type;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final backgroundColor = switch (type) {
      AppFormButtonType.primary => colorScheme.primary,
      AppFormButtonType.secondary => colorScheme.secondary,
      AppFormButtonType.outlined => Colors.transparent,
    };
    final foregroundColor = switch (type) {
      AppFormButtonType.primary => colorScheme.onPrimary,
      AppFormButtonType.secondary => colorScheme.onSecondary,
      AppFormButtonType.outlined => colorScheme.primary,
    };

    final textStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: foregroundColor,
    ).reverseMerge(theme.textTheme.labelLarge);

    const minimumSize = Size(400, 60);

    const shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );

    final padding = _scaledPadding(context);

    return switch (type) {
      AppFormButtonType.outlined => OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          minimumSize: minimumSize,
          maximumSize: Size(minimumSize.width, double.infinity),
          shape: shape,
          padding: padding,
          disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
          disabledBackgroundColor: Colors.transparent,
          shadowColor: theme.shadowColor,
          elevation: 0,
          textStyle: textStyle,
          side: BorderSide(
            color: foregroundColor,
          ),
          enabledMouseCursor: SystemMouseCursors.click,
          disabledMouseCursor: SystemMouseCursors.basic,
          visualDensity: theme.visualDensity,
          tapTargetSize: theme.materialTapTargetSize,
          animationDuration: kThemeChangeDuration,
          enableFeedback: true,
          alignment: Alignment.center,
          splashFactory: InkRipple.splashFactory,
        ),
      _ => ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
          disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
          elevation: 0,
          textStyle: textStyle,
          padding: padding,
          minimumSize: minimumSize,
          maximumSize: Size(minimumSize.width, double.infinity),
          shape: shape,
          enabledMouseCursor: SystemMouseCursors.click,
          disabledMouseCursor: SystemMouseCursors.basic,
          visualDensity: theme.visualDensity,
          tapTargetSize: theme.materialTapTargetSize,
          animationDuration: kThemeChangeDuration,
          enableFeedback: true,
          alignment: Alignment.center,
          splashFactory: InkRipple.splashFactory,
        ).copyWith(
          elevation: WidgetStateProperty.resolveWith<double>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return 2;
              }
              return 0;
            },
          ),
        ),
    };
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return _getThemeStyle(context, type) ?? style;
  }

  EdgeInsetsGeometry _scaledPadding(BuildContext context) {
    return ButtonStyleButton.scaledPadding(
      const EdgeInsets.symmetric(horizontal: 16),
      const EdgeInsets.symmetric(horizontal: 8),
      const EdgeInsets.symmetric(horizontal: 4),
      // ignore: deprecated_member_use
      MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
    );
  }
}

ButtonStyle? _getThemeStyle(BuildContext context, AppFormButtonType type) {
  return switch (type) {
    AppFormButtonType.primary =>
      context.theme.extension<AppPrimaryFormButtonThemeData>()?.style,
    AppFormButtonType.secondary =>
      context.theme.extension<AppSecondaryFormButtonThemeData>()?.style,
    AppFormButtonType.outlined =>
      context.theme.extension<AppOutlinedFormButtonThemeData>()?.style,
  };
}
