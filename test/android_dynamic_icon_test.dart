// import 'package:flutter_test/flutter_test.dart';
// import 'package:android_dynamic_icon/android_dynamic_icon.dart';
// import 'package:android_dynamic_icon/android_dynamic_icon_platform_interface.dart';
// import 'package:android_dynamic_icon/android_dynamic_icon_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockAndroidDynamicIconPlatform
//     with MockPlatformInterfaceMixin
//     implements AndroidDynamicIconPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final AndroidDynamicIconPlatform initialPlatform = AndroidDynamicIconPlatform.instance;

//   test('$MethodChannelAndroidDynamicIcon is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelAndroidDynamicIcon>());
//   });

//   test('getPlatformVersion', () async {
//     AndroidDynamicIcon androidDynamicIconPlugin = AndroidDynamicIcon();
//     MockAndroidDynamicIconPlatform fakePlatform = MockAndroidDynamicIconPlatform();
//     AndroidDynamicIconPlatform.instance = fakePlatform;

//     expect(await androidDynamicIconPlugin.getPlatformVersion(), '42');
//   });
// }
