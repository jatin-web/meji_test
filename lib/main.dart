import 'package:flutter/material.dart';
import 'package:meji_digital_test/presentation/screens/home_screen.dart';
import 'package:meji_digital_test/presentation/screens/login_screen.dart';
import 'package:meji_digital_test/presentation/screens/splash_screen.dart';
import 'package:meji_digital_test/route_navigator.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: snackbarKey,
      onGenerateRoute: RouteNavigator.onGenerateRoute,
      initialRoute: SplashScreen.pageId,
    );
  }
}
