import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vitmarketplace/firebase_options.dart';
import 'package:vitmarketplace/ui/homescreen.dart';
import 'package:vitmarketplace/ui/welcomescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: (FirebaseAuth.instance.currentUser?.uid!=null)?HomeScreen(startingpage: 0):WelcomeScreen());
  }
}
