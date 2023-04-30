import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_dynamic_icon_platform_interface.dart';

/// An implementation of [AndroidDynamicIconPlatform] that uses method channels.
class MethodChannelAndroidDynamicIcon extends AndroidDynamicIconPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_dynamic_icon');

  @override
  Future<void> changeIcon(
      {required String bundleId,
      required bool isNewIcon,
      required String iconName,
      required List<String> iconNames}) async {
    dynamic params = {
      "bundleId": bundleId,
      "isNewIcon": isNewIcon,
      "iconName": iconName,
      "iconNames": iconNames,
    };
    await methodChannel.invokeMethod<void>('changeIcon', params);
  }
}
