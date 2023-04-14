import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:croshez/modules/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

// import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Croshez',
        theme: ThemeData(
          primaryColor: Colors.amber,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SplashScreen());
  }
}
