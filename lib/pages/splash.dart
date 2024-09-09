import 'package:flutter/material.dart';
// import 'package:tastore/pages/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay to simulate splash screen duration
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the Onboarding screen
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 400.0, // Adjust size as needed
          height: 400.0, // Adjust size as needed
          child: Image.asset('images/LogoTuf.png'), // Replace with your logo
        ),
      ),
    );
  }
}
