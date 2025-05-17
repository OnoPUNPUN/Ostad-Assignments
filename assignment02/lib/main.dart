import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flag_grid_homePage.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => ResponsiveFlagGridApp(),
    ),
  );
}

class ResponsiveFlagGridApp extends StatelessWidget {
  const ResponsiveFlagGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfect Responsive Flag Grid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FlagGridHomePage(),
    );
  }
}