import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meji_digital_test/data/repo/auth_repo.dart';
import 'package:meji_digital_test/local_data/preferences.dart';
import 'package:meji_digital_test/presentation/components/buttons/simple_buttton.dart';
import 'package:meji_digital_test/presentation/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String pageId = "registerScreen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
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
                  Image.asset(
                    "assets/images/logo.png",
                    height: 50,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Sign Up With Your Email Address",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "First Name",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter last name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Last Name",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 20),
                  SimpleButton(
                    title: "Create Account",
                    isLaoding: isLoading,
                    onTap: () async {
                      if (!_formKey.currentState!.validate()) {
                        print("Invalid");
                        return;
                      }
                      setState(() {
                        isLoading = true;
                      });
                      AuthRepo authRepo = AuthRepo();
                      var response = await authRepo.register(
                          firstName: _firstNameController.text.trim(),
                          lastName: _lastNameController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim());
                      log("response register screen: $response");
                      if (response != null) {
                        SharedPreferenceUtils prefs = SharedPreferenceUtils();
                        await prefs.setString(
                            SharedPreferenceUtils.email, response['email']);
                        await prefs.setString(SharedPreferenceUtils.firstName,
                            response['first_name']);
                        await prefs.setString(SharedPreferenceUtils.lastName,
                            response['last_name']);
                        await prefs.setBool(SharedPreferenceUtils.login, true);

                        if (mounted) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, HomeScreen.pageId, (f)=>false);
                        }
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
