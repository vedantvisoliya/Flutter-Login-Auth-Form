import 'package:flutter/material.dart';
import 'package:login_auth_form/firebase_options.dart';
import 'package:login_auth_form/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_auth_form/pages/home_page.dart';
import 'package:login_auth_form/pages/login_page.dart';
import 'package:login_auth_form/pages/register_pages/register_page_3.dart';
import 'package:login_auth_form/pages/register_pages/register_page_1.dart';
import 'package:login_auth_form/pages/register_pages/register_page_2.dart';
import 'package:login_auth_form/services/data.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => Data(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth Page',
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/r1': (context) => const RegisterPage1(),
        '/r2': (context) => const RegisterPage2(),
        '/r3': (context) => const RegisterPage3(),
      },
    );
  }
}
