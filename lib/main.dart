import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_shopping_list/exports.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MainApp(), // Wrap your app
  ),
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: routes, home: const HomeView());
  }
}
