import 'package:flutter/material.dart';
import 'package:meji_digital_test/local_data/preferences.dart';
import 'package:meji_digital_test/presentation/screens/home_screen.dart';
import 'package:meji_digital_test/presentation/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String pageId = "splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getInfo();
    super.initState();
  }

  getInfo() async {
    SharedPreferenceUtils prefs = SharedPreferenceUtils();
    bool isLogin = await prefs.getBool(SharedPreferenceUtils.login);
    if (mounted) {
      if (isLogin) {
        Navigator.pushReplacementNamed(context, HomeScreen.pageId);
      } else {
        Navigator.pushReplacementNamed(context, LoginScreen.pageId);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
