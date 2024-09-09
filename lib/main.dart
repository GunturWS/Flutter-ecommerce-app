import 'package:flutter/material.dart';
import 'package:tastore/auth/login.dart';
import 'package:tastore/pages/blog.dart';
import 'package:tastore/pages/home.dart';
import 'package:tastore/pages/onboarding.dart';
import 'package:tastore/pages/splash.dart';
import 'package:tastore/screens/navbar.dart'; // Update import path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash', // Set the initial route
      routes: {
        '/splash': (context) => const SplashScreen(), // Route for SplashScreen
        '/onboarding': (context) => const Onboarding(), // Route for Onboarding
        '/login': (context) => const LogIn(), // Route for Login
        '/home': (context) => BottomNavBar(
              screens: [
                const HomePage(), // Home screen
                const BlogPage(),
                Center(
                    child: Text('Cart Screen',
                        style: TextStyle(
                            fontSize: 24))), // Cart screen placeholder
                Center(
                    child: Text('Profile Screen',
                        style: TextStyle(
                            fontSize: 24))), // Profile screen placeholder
              ],
            ),
      },
    );
  }
}
