import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AssetsScope extends StatelessWidget {
  const AssetsScope({
    super.key,
    required this.child,
  });

  final Widget child;

  static AssetBundle of(BuildContext context) => DefaultAssetBundle.of(context);

  @override
  Widget build(BuildContext context) {
    return DefaultAssetBundle(
      bundle: _PlatformAssetBundle(),
      child: child,
    );
  }
}

class _PlatformAssetBundle extends PlatformAssetBundle {
  String checkAndChangeKey(String key) {
    if (key != 'AssetManifest.bin' && !key.startsWith('packages')) {
      key = 'packages/assets/$key';
    }
    return key;
  }

  @override
  Future<ByteData> load(String key) {
    key = checkAndChangeKey(key);
    return super.load(key);
  }

  @override
  Future<ImmutableBuffer> loadBuffer(String key) {
    key = checkAndChangeKey(key);
    return super.loadBuffer(key);
  }
}
