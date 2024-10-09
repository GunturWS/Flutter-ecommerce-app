import 'package:flutter/material.dart';
import 'package:tastore/auth/login.dart';
import 'package:tastore/auth/register.dart';
import 'package:tastore/pages/blog.dart';
import 'package:tastore/pages/cart.dart';
import 'package:tastore/pages/home.dart';
import 'package:tastore/pages/profile.dart';
import 'package:tastore/screens/onboarding.dart';
// import 'package:tastore/screens/splash.dart';
import 'package:tastore/screens/navbar.dart'; // Update import path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'taStore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/onboarding', // Set the initial route
      routes: {
        // '/splash': (context) => const SplashScreen(), // Route for SplashScreen
        '/onboarding': (context) => const Onboarding(), // Route for Onboarding

        // Auth
        '/login': (context) => const LogIn(), // Route for Login
        '/register': (context) => const RegisterPage(), // Route for Register
        ''
            '/home': (context) => BottomNavBar(
              screens: [
                const HomePage(), // Home screen
                const BlogPage(), // Blog Screen
                const CartPage(), // Chart Screen
                const ProfilePage(), // Profile screen
              ],
            ),
      },
    );
  }
}
