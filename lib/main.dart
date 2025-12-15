import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // Only needed for web, mobile apps read from config files automatically
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCZAky2lyKNFXLDCIpYGjuvdTMSPxe4gTA",
        authDomain: "login-flutter-2ecaa.firebaseapp.com",
        projectId: "login-flutter-2ecaa",
        storageBucket: "login-flutter-2ecaa.firebasestorage.app",
        messagingSenderId: "258306770445",
        appId: "1:258306770445:web:b0153d82f85d026367f744",
        measurementId: "G-W0492XHKT4", // optional
      ),
    );
  } else {
    // Mobile (Android/iOS) uses the config files automatically
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Login',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
