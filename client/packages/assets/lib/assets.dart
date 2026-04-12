import 'package:flutter_svg/flutter_svg.dart';

export 'src/application/application.dart';
export 'src/gen/assets.gen.dart';
export 'src/gen/fonts.gen.dart';

Future<void> loadSvg({required List<String> paths}) async {
  for (var svgPath in paths) {
    var loader = SvgAssetLoader(svgPath, packageName: 'assets');
    await svg.cache
        .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
  }
}
