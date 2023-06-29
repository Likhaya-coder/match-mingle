import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:match_mingle/pages/forgot_password.dart';
import 'package:match_mingle/pages/signup.dart';
import 'package:match_mingle/pages/login.dart';
import 'package:match_mingle/pages/navigation.dart';
import 'firebase_options.dart';
import 'package:match_mingle/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: HomeScreen.id,
    routes: {
      HomeScreen.id: (context) => const HomeScreen(),
      LoginScreen.id: (context) => const LoginScreen(),
      SignupScreen.id: (context) => const SignupScreen(),
      NavigationScreen.id: (context) => const NavigationScreen(),
      ForgotPassword.id: (context) => const ForgotPassword(),
    },
  ));
}

