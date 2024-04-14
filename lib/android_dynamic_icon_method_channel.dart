import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_dynamic_icon_platform_interface.dart';

/// An implementation of [AndroidDynamicIconPlatform] that uses method channels.
class MethodChannelAndroidDynamicIcon extends AndroidDynamicIconPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('AndroidDynamicIcon');

  @override
  Future<void> initialize({required List<String> classNames}) async {
    await methodChannel.invokeMethod("initialize", classNames);
  }

  @override
  Future<void> changeIcon({required List<String> classNames}) async {
    await methodChannel.invokeMethod("changeIcon", classNames);
  }
}
