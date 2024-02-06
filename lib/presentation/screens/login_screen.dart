import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:meji_digital_test/data/repo/auth_repo.dart';
import 'package:meji_digital_test/local_data/preferences.dart';
import 'package:meji_digital_test/presentation/components/buttons/simple_buttton.dart';
import 'package:meji_digital_test/presentation/screens/home_screen.dart';
import 'package:meji_digital_test/presentation/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String pageId = "loginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLaoding = false;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    "Welcome to",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 50,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter email";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Email Address",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: const UnderlineInputBorder(),
                        suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: Icon(obscureText
                                ? Icons.visibility
                                : Icons.visibility_off))),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please enter password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  SimpleButton(
                    title: "Login",
                    isLaoding: isLaoding,
                    onTap: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      setState(() {
                        isLaoding = true;
                      });
                      AuthRepo authRepo = AuthRepo();
                      var response = await authRepo.login(
                          _emailController.text.trim(),
                          _passwordController.text.trim());
                      log("response: $response");
                      if (response != null) {
                        SharedPreferenceUtils prefs = SharedPreferenceUtils();
                        await prefs.setString(
                            SharedPreferenceUtils.email, response['email']);
                        await prefs.setString(SharedPreferenceUtils.firstName,
                            response['firstName']);
                        await prefs.setString(SharedPreferenceUtils.lastName,
                            response['lastName']);

                        await prefs.setBool(SharedPreferenceUtils.login, true);

                        if (mounted) {
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.pageId);
                        }
                      }
                      setState(() {
                        isLaoding = false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterScreen.pageId);
                        },
                        child: const Text(
                          "Create new account",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
