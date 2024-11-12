import 'package:flutter/material.dart';
import 'package:test_project/core/local_storage/hive.dart';
import 'package:test_project/ui/splash_screen/presentation/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await StorageServiceMixin.initHive();
  
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:SplashPage(),
    );
  }
}

