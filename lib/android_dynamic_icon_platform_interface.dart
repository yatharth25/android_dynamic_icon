import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_dynamic_icon_method_channel.dart';

abstract class AndroidDynamicIconPlatform extends PlatformInterface {
  /// Constructs a AndroidDynamicIconPlatform.
  AndroidDynamicIconPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidDynamicIconPlatform _instance =
      MethodChannelAndroidDynamicIcon();

  /// The default instance of [AndroidDynamicIconPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidDynamicIcon].
  static AndroidDynamicIconPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidDynamicIconPlatform] when
  /// they register themselves.
  static set instance(AndroidDynamicIconPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initialize({required List<String> classNames}) async {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  Future<void> changeIcon({required List<String> classNames}) {
    throw UnimplementedError('changeIcon() has not been implemented.');
  }
}
