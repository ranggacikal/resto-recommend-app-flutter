import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home')
      ),
      body: Center(
        child: Text(
          'Halo ${user?.displayName ?? 'User'}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

}