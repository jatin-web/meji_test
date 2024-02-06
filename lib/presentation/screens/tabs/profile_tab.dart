import 'package:flutter/material.dart';
import 'package:meji_digital_test/constants.dart';
import 'package:meji_digital_test/local_data/preferences.dart';
import 'package:meji_digital_test/presentation/components/buttons/simple_buttton.dart';
import 'package:meji_digital_test/presentation/components/text_fields/profile_field.dart';
import 'package:meji_digital_test/presentation/screens/login_screen.dart';

class ProfileTab extends StatefulWidget {
  static const String pageId = "profileScreen";
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String? email;
  String? firstName;
  String? lastName;
  @override
  void initState() {
    loadInfo();
    super.initState();
  }

  loadInfo() async {
    SharedPreferenceUtils prefs = SharedPreferenceUtils();
    email = await prefs.getString(SharedPreferenceUtils.email);
    firstName = await prefs.getString(SharedPreferenceUtils.firstName);
    lastName = await prefs.getString(SharedPreferenceUtils.lastName);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                "My Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            ProfileField(
              title: "First Name",
              val: firstName ?? "",
              bottomMargin: 20,
            ),
            ProfileField(
              title: "Last Name",
              val: lastName ?? "",
              bottomMargin: 20,
            ),
            ProfileField(
              title: "Email Address",
              val: email ?? "",
              bottomMargin: 20,
            ),
            const SizedBox(height: 40),
            SimpleButton(title: "Update My Account", onTap: () {}),
            const SizedBox(height: 30),
            SimpleButton(
                title: "Logout",
                onTap: () async {
                  SharedPreferenceUtils prefs = SharedPreferenceUtils();
                  await prefs.clearPrefs();
                  if (mounted) {
                    Navigator.pushReplacementNamed(context, LoginScreen.pageId);
                  }
                },
                color: themeColor.withOpacity(0.8)),
          ],
        ),
      ),
    );
  }
}
