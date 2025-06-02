// ignore_for_file: avoid_print

import 'dart:io';

import 'package:yaml/yaml.dart';

void main() {
  // توفير خيارين للمستخدم
  print("Enter your choice:");
  print("1. Create one future ");
  print("2. Create Multiple future");

  String? choice = stdin.readLineSync();

  if (choice == '1') {
    // إذا اختار المستخدم future واحدة
    createSingleFuture();
  } else if (choice == '2') {
    // إذا اختار المستخدم إنشاء عدة futures
    createMultipleFutures();
  } else {
    print("not valid input");
  }
}

void createSingleFuture() {
  // طلب اسم الـ future
  print("Enter future Name (if name is empty \"newFuture\"):");
  String? futureName = stdin.readLineSync();

  // إذا لم يُدخل المستخدم اسمًا، استخدام الاسم الافتراضي
  if (futureName == null || futureName.isEmpty) {
    futureName = 'newFuture';
  }

  createFutureStructure(futureName);
  addRouteToCore(futureName);
  addExportToFile(futureName);
}

void createMultipleFutures() {
  List<String> futureNames = [];

  // التكرار لطلب الأسماء من المستخدم
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

  // إنشاء المجلدات والملفات لكل اسم
  for (String name in futureNames) {
    createFutureStructure(name);
    addRouteToCore(name);
    addExportToFile(name);
  }
}

void createFutureStructure(String futureName) {
  // مسار المشروع
  final projectPath = "${Directory.current.path}/lib/Futures/$futureName";

  // إنشاء المجلدات المطلوبة
  final directories = [
    '$projectPath/data/models',
    '$projectPath/data/LocalData',
    '$projectPath/data/RemoteData',
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

  // إنشاء ملفات الـ Dart في المجلدات الصحيحة
  createDartFile(
      filePath: '$projectPath/View/${futureName}_view.dart',
      content: createViewFileContent(futureName));
  createDartFile(
      filePath: '$projectPath/Widgets/${futureName}_body.dart',
      content: createBodyFileContent(futureName));

  print("تم إنشاء الملفات والمجلدات لـ: $futureName ✅");
}

// دالة لإضافة route إلى core/routes.dart
void addRouteToCore(String futureName) {
  final routesFilePath = "${Directory.current.path}/lib/core/route/routes.dart";
  final routesFile = File(routesFilePath);

  if (routesFile.existsSync()) {
    String routeEntry = '''
      '/$futureName': (context) => ${futureName.capitalize()}View(),
    ''';

    String existingContent = routesFile.readAsStringSync();

    if (!existingContent.contains(routeEntry)) {
      routesFile.writeAsStringSync(existingContent.replaceFirst(
        '};', // افتراض أن نهاية قائمة الـ routes تحتوي على `};`
        '  $routeEntry\n};',
      ));
      print('Added $futureName route to core/routes.dart ✅');
    } else {
      print('Route for $futureName already exists in core/route/routes.dart');
    }
  } else {
    print('core/route/routes.dart not found ❌');
  }
}

// دالة لإضافة export إلى ملف export.dart
void addExportToFile(String futureName) {
  final exportFilePath = "${Directory.current.path}/lib/exports.dart";
  final exportFile = File(exportFilePath);

  // استخراج اسم المشروع من ملف pubspec.yaml
  final pubspecFile = File("${Directory.current.path}/pubspec.yaml");
  String projectName = "your_project"; // القيمة الافتراضية

  if (pubspecFile.existsSync()) {
    final pubspecContent = pubspecFile.readAsStringSync();
    final pubspec = loadYaml(pubspecContent);
    if (pubspec['name'] != null) {
      projectName = pubspec['name'];
    }
  }

  String exportEntry = '''
export 'package:$projectName/Futures/$futureName/View/${futureName}_view.dart';
''';

  if (exportFile.existsSync()) {
    String existingContent = exportFile.readAsStringSync();

    // تحقق إذا كان الإدخال موجودًا بالفعل
    if (!existingContent.contains(exportEntry.trim())) {
      // إضافة الإدخال الجديد دون الكتابة فوق المحتوى القديم
      exportFile.writeAsStringSync(exportEntry, mode: FileMode.append);
      print('Added $futureName export to exports.dart ✅');
    } else {
      print('Export for $futureName already exists in exports.dart');
    }
  } else {
    print('exports.dart not found, creating a new one... ❌');
    exportFile.createSync();
    exportFile.writeAsStringSync('''
// Exports for Futures
$exportEntry
    ''');
    print('Created and added $futureName export to new exports.dart ✅');
  }
}

// دالة لإنشاء ملفات Dart
void createDartFile({required String filePath, String? content}) {
  final dartFile = File(filePath);

  if (!dartFile.existsSync()) {
    dartFile.createSync(recursive: true);
    content != null ? dartFile.writeAsStringSync(content) : null;
    print('Created Dart file: $filePath ✅');
  } else {
    print('Dart file already exists: $filePath');
  }
}

// محتوى ملف الـ View
String createViewFileContent(String futureName) {
  return '''

import 'package:${pubName()}/exports.dart';
import '../Widgets/${futureName}_body.dart';

class ${futureName.capitalize()}View extends StatelessWidget {
    const ${futureName.capitalize()}View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$futureName View'),
      ),
      body: ${futureName.capitalize()}Body(),
    );
  }
}
  ''';
}

String createExportsFileContent(String futureName) {
  return '''
export 'package:${pubName()}/Core/route/routes.dart';
export 'package:flutter/material.dart';
  ''';
}

String createExportsToMainFileContent(String futureName) {
  return '''

import 'package:${pubName()}/exports.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home: const HomeView(),
    );
  }
}

  ''';
}

String createRoutesFileContent(String futureName) {
  return '''
import 'package:${pubName()}/exports.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{

    
};

  ''';
}

// محتوى ملف الـ Body
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

// دالة لإضافة أول حرف كـ capital
extension StringCasingExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}

String pubName() {
  // استخراج اسم المشروع من ملف pubspec.yaml
  final pubspecFile = File("${Directory.current.path}/pubspec.yaml");
  String projectName = "your_project"; // القيمة الافتراضية

  if (pubspecFile.existsSync()) {
    final pubspecContent = pubspecFile.readAsStringSync();
    final pubspec = loadYaml(pubspecContent);
    if (pubspec['name'] != null) {
      projectName = pubspec['name'];
    }
  }
  return projectName;
}
