// ignore_for_file: avoid_print

import 'dart:io';

import 'package:yaml/yaml.dart';

void main() {
  print("Enter your choice:");
  print("1. Create one future ");
  print("2. Create Multiple future");

  String? choice = stdin.readLineSync();

  if (choice == '1') {
    createSingleFuture();
  } else if (choice == '2') {
    createMultipleFutures();
  } else {
    print("not valid input");
  }
}

void createSingleFuture() {
  print("Enter future Name (if name is empty \"newFuture\"):");
  String? futureName = stdin.readLineSync();

  if (futureName == null || futureName.isEmpty) {
    futureName = 'newFuture';
  }

  createFutureStructure(futureName);
  addRouteToCore(futureName);
  addExportToFile(futureName);
}

void createMultipleFutures() {
  List<String> futureNames = [];

  while (true) {
    print("أدخل اسم future (أدخل 'X' لإنهاء الإدخال):");
    String? futureName = stdin.readLineSync();

    if (futureName == null || futureName.toLowerCase() == 'x') {
      break;
    }

    if (futureName.isNotEmpty) {
      futureNames.add(futureName);
    }
  }

  for (String name in futureNames) {
    createFutureStructure(name);
    addRouteToCore(name);
    addExportToFile(name);
  }
}

void createFutureStructure(String futureName) {
  final projectPath = "${Directory.current.path}/lib/Futures/$futureName";

  final directories = [
    '$projectPath/data/models',
    '$projectPath/data/LocalData',
    '$projectPath/data/RemoteData',
    '$projectPath/View',
    '$projectPath/Widgets',
  ];

  for (var dir in directories) {
    final directory = Directory(dir);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      print('Created directory: $dir ✅');
    } else {
      print('Directory already exists: $dir');
    }
  }

  // إنشاء 3 ملفات View
  createDartFile(
    filePath: '$projectPath/View/${futureName}MobileView.dart',
    content: createMobileViewFileContent(futureName),
  );

  createDartFile(
    filePath: '$projectPath/View/${futureName}TabletView.dart',
    content: createTabletViewFileContent(futureName),
  );

  createDartFile(
    filePath: '$projectPath/View/${futureName}DesktopView.dart',
    content: createDesktopViewFileContent(futureName),
  );

  // إنشاء ملف Body
  createDartFile(
    filePath: '$projectPath/Widgets/${futureName}_body.dart',
    content: createBodyFileContent(futureName),
  );

  print("تم إنشاء الملفات والمجلدات لـ: $futureName ✅");
}

void addRouteToCore(String futureName) {
  final routesFilePath = "${Directory.current.path}/lib/core/route/routes.dart";
  final routesFile = File(routesFilePath);

  if (routesFile.existsSync()) {
    String routeEntry =
        '''
  // Routes for $futureName
  '/${futureName}Mobile': (context) => ${futureName.capitalize()}MobileView(),
  '/${futureName}Tablet': (context) => ${futureName.capitalize()}TabletView(),
  '/${futureName}Desktop': (context) => ${futureName.capitalize()}DesktopView(),
''';

    String existingContent = routesFile.readAsStringSync();

    if (!existingContent.contains(routeEntry.trim())) {
      routesFile.writeAsStringSync(
        existingContent.replaceFirst(
          '};', // نهاية خريطة الـ routes
          '  $routeEntry\n};',
        ),
      );
      print('Added $futureName routes to core/routes.dart ✅');
    } else {
      print('Routes for $futureName already exist in core/routes.dart');
    }
  } else {
    print('core/route/routes.dart not found ❌');
  }
}

void addExportToFile(String futureName) {
  final exportFilePath = "${Directory.current.path}/lib/exports.dart";
  final exportFile = File(exportFilePath);

  final pubspecFile = File("${Directory.current.path}/pubspec.yaml");
  String projectName = "your_project";

  if (pubspecFile.existsSync()) {
    final pubspecContent = pubspecFile.readAsStringSync();
    final pubspec = loadYaml(pubspecContent);
    if (pubspec['name'] != null) {
      projectName = pubspec['name'];
    }
  }

  String exportEntry =
      '''
export 'package:$projectName/Futures/$futureName/View/${futureName}MobileView.dart';
export 'package:$projectName/Futures/$futureName/View/${futureName}TabletView.dart';
export 'package:$projectName/Futures/$futureName/View/${futureName}DesktopView.dart';
export 'package:$projectName/Futures/$futureName/Widgets/${futureName}_body.dart';
''';

  if (exportFile.existsSync()) {
    String existingContent = exportFile.readAsStringSync();

    if (!existingContent.contains(exportEntry.trim())) {
      exportFile.writeAsStringSync(exportEntry, mode: FileMode.append);
      print('Added $futureName exports to exports.dart ✅');
    } else {
      print('Exports for $futureName already exist in exports.dart');
    }
  } else {
    print('exports.dart not found, creating a new one... ❌');
    exportFile.createSync();
    exportFile.writeAsStringSync('''// Exports for Futures
$exportEntry
''');
    print('Created and added $futureName exports to new exports.dart ✅');
  }
}

void createDartFile({required String filePath, String? content}) {
  final dartFile = File(filePath);

  if (!dartFile.existsSync()) {
    dartFile.createSync(recursive: true);
    if (content != null) {
      dartFile.writeAsStringSync(content);
    }
    print('Created Dart file: $filePath ✅');
  } else {
    print('Dart file already exists: $filePath');
  }
}

String createMobileViewFileContent(String futureName) {
  return '''
import 'package:flutter/material.dart';
import '../Widgets/${futureName}_body.dart';

class ${futureName.capitalize()}MobileView extends StatelessWidget {
  const ${futureName.capitalize()}MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$futureName Mobile View'),
      ),
      body: ${futureName.capitalize()}Body(),
    );
  }
}
''';
}

String createTabletViewFileContent(String futureName) {
  return '''
import 'package:flutter/material.dart';
import '../Widgets/${futureName}_body.dart';

class ${futureName.capitalize()}TabletView extends StatelessWidget {
  const ${futureName.capitalize()}TabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$futureName Tablet View'),
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          child: ${futureName.capitalize()}Body(),
        ),
      ),
    );
  }
}
''';
}

String createDesktopViewFileContent(String futureName) {
  return '''
import 'package:flutter/material.dart';
import '../Widgets/${futureName}_body.dart';

class ${futureName.capitalize()}DesktopView extends StatelessWidget {
  const ${futureName.capitalize()}DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$futureName Desktop View'),
      ),
      body: Center(
        child: SizedBox(
          width: 1000,
          child: ${futureName.capitalize()}Body(),
        ),
      ),
    );
  }
}
''';
}

String createBodyFileContent(String futureName) {
  return '''
import 'package:flutter/material.dart';

class ${futureName.capitalize()}Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is the $futureName body'),
    );
  }
}
''';
}

extension StringCasingExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}
