import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meji_digital_test/data/endpoints.dart';
import 'package:meji_digital_test/data/network.dart';
import 'package:meji_digital_test/main.dart';

class AuthRepo {
  Future login(String email, String password) async {
    Network network = Network();
    try {
      var response = await network
          .post(Apis.loginApi, {"email": email, "password": password});

      if (response != null && response['statusCode'] == null) {
        return response;
      } else if (response['statusCode'] != null &&
          response['statusCode'] == 400) {
        snackbarKey.currentState!
            .showSnackBar(SnackBar(content: Text(response['message'])));
      } else {
        snackbarKey.currentState!
            .showSnackBar(const SnackBar(content: Text("Error")));
      }
    } catch (e) {
      snackbarKey.currentState!.showSnackBar(
          const SnackBar(content: Text("You are not authorized")));
    }
  }

  Future register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    Network network = Network();
    try {
      var response = await network.post(Apis.registerApi, {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
      });
      if (response != null) {
        return response;
      } else {
        snackbarKey.currentState!
            .showSnackBar(const SnackBar(content: Text("Error")));
      }
    } catch (e) {
      snackbarKey.currentState!.showSnackBar(
          const SnackBar(content: Text("You are not authorized")));
    }
  }
}
