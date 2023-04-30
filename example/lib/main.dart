import 'package:flutter/material.dart';
import 'package:android_dynamic_icon/android_dynamic_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _androidDynamicIconPlugin = AndroidDynamicIcon();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: GestureDetector(
          onTap: () async {
            await _androidDynamicIconPlugin.changeIcon(
                bundleId: "com.example.app",
                isNewIcon: true,
                iconName: "alternateIconName",
                iconNames: ["icon1name", 'icon2name']);
          },
          child: const Center(
            child: Text('Change Icon'),
          ),
        ),
      ),
    );
  }
}
