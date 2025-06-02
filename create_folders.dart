// ignore_for_file: avoid_print

import 'dart:io';

import 'create_future.dart';

void main() {
  // project path
  final projectPath = "${Directory.current.path}/lib";

// folder Creation
  final directories = [
    '$projectPath/Core/Utils',
    '$projectPath/data/models',
    '$projectPath/data/repositories',
    '$projectPath/data/dataources',
    '$projectPath/domain/entities',
    '$projectPath/domain/repositories',
    '$projectPath/domain/useCases',
    // '$projectPath/presention/pages/useCases',
    // '$projectPath/presention/pages/Widgets',
  ];

  for (var dir in directories) {
    final directory = Directory(dir);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      print('Created: $dir ✅');
    } else {
      print('dirctory already exists: $dir');
    }
  }
  print("creating files Successfuly ✅");

  // create exports
  if (!Directory('$projectPath/exports.dart').existsSync()) {
    createDartFile(
        filePath: '$projectPath/exports.dart',
        content: createExportsFileContent(""));
    print('Created: exports');
  } else {
    print('dirctory already exists: exports.dart');
  }
  // create route
  if (!Directory('$projectPath/Core/route/routes.dart').existsSync()) {
    createDartFile(
        filePath: '$projectPath/Core/route/routes.dart',
        content: createRoutesFileContent(""));
    print('Created: routes');
  } else {
    print('dirctory already exists: routes.dart');
  }
  // add exports to main
  Directory('$projectPath/main.dart').deleteSync(recursive: true);
  createDartFile(
      filePath: '$projectPath/main.dart',
      content: createExportsToMainFileContent(""));
  print('Added: main');
}
