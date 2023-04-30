import 'android_dynamic_icon_platform_interface.dart';

class AndroidDynamicIcon {
  Future<void> changeIcon(
      {required String bundleId,
      required bool isNewIcon,
      required String iconName,
      required List<String> iconNames}) {
    return AndroidDynamicIconPlatform.instance.changeIcon(
        bundleId: bundleId,
        isNewIcon: isNewIcon,
        iconName: iconName,
        iconNames: iconNames);
  }
}
