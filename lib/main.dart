import 'package:flutter/material.dart';
import 'package:pragma_cats/features/launch/splash_screen.dart';
import 'features/cat_breeds/Application/di/injection_container.dart';
import 'core/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initCoreDependencies();
  await initCatBreedsDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Breeds App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}
