// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:android_dynamic_icon/android_dynamic_icon_method_channel.dart';

// void main() {
//   MethodChannelAndroidDynamicIcon platform = MethodChannelAndroidDynamicIcon();
//   const MethodChannel channel = MethodChannel('android_dynamic_icon');

//   TestWidgetsFlutterBinding.ensureInitialized();

//   setUp(() {
//     channel.setMockMethodCallHandler((MethodCall methodCall) async {
//       return '42';
//     });
//   });

//   tearDown(() {
//     channel.setMockMethodCallHandler(null);
//   });

//   test('getPlatformVersion', () async {
//     expect(await platform.getPlatformVersion(), '42');
//   });
// }
