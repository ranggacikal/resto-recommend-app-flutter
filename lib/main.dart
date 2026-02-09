import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restorecommendapps/presentation/login/login_screen.dart';
import 'package:restorecommendapps/theme/app_colors.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // testFirestore();
  runApp(const MyApp());
}

void testFirestore() async {
  await FirebaseFirestore.instance
      .collection('connection_test')
      .add({
        'status': 'connected',
        'time': Timestamp.now(),
      });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.secondary,
        ),
        useMaterial3: true
      ),
      home: LoginScreen(),
    );
  }
}
