import 'package:flutter/material.dart';
import 'package:meji_digital_test/presentation/screens/home_screen.dart';
import 'package:meji_digital_test/presentation/screens/login_screen.dart';
import 'package:meji_digital_test/presentation/screens/splash_screen.dart';
import 'package:meji_digital_test/presentation/screens/tabs/profile_tab.dart';
import 'package:meji_digital_test/presentation/screens/register_screen.dart';

class RouteNavigator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.pageId:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case LoginScreen.pageId:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RegisterScreen.pageId:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case ProfileTab.pageId:
        return MaterialPageRoute(builder: (context) => const ProfileTab());
      case SplashScreen.pageId:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      default:
        return MaterialPageRoute(
            builder: (context) =>
                const Scaffold(body: Center(child: Text("Error route"))));
    }
  }
}
