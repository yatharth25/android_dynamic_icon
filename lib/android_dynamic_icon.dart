import 'android_dynamic_icon_platform_interface.dart';

class AndroidDynamicIcon {
  static Future<void> initialize({required List<String> classNames}) async {
    await AndroidDynamicIconPlatform.instance
        .initialize(classNames: classNames);
  }

  Future<void> changeIcon({required List<String> classNames}) async {
    await AndroidDynamicIconPlatform.instance
        .changeIcon(classNames: classNames);
  }
}
