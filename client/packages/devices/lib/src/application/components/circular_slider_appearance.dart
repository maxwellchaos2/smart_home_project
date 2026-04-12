import 'package:common/common.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

buildDefaultCircularSliderAppearance(BuildContext context) =>
    CircularSliderAppearance(
      customWidths: CustomSliderWidths(
        progressBarWidth: 10,
        shadowWidth: 10,
        trackWidth: 10,
        handlerSize: 12,
      ),
      customColors: CustomSliderColors(
        progressBarColor: context.theme.primaryColor,
        trackColor: context.theme.primaryColor,
        shadowColor: context.theme.primaryColor,
        shadowMaxOpacity: 0.05,
        shadowStep: 10,
      ),
    );
