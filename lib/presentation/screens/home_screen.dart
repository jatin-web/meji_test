import 'package:flutter/material.dart';
import 'package:meji_digital_test/presentation/screens/tabs/home_tab.dart';
import 'package:meji_digital_test/presentation/screens/tabs/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String pageId = "homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currIndex = 0;
  final List<Widget> _tabs = [
    const Hometab(),
    const Hometab(),
    const Hometab(),
    const Hometab(),
    const ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.fill,
            height: 40,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          // shadowColor: Colors.white,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 5,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currIndex,
            unselectedItemColor: Colors.indigo,
            selectedItemColor: Colors.indigo,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: (val) {
              setState(() {
                _currIndex = val;
              });
            },
            selectedLabelStyle:
                const TextStyle(fontSize: 10, color: Colors.black),
            items: const [
              BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: "My Orders", icon: Icon(Icons.list_alt_sharp)),
              BottomNavigationBarItem(
                  label: "Place an ad", icon: Icon(Icons.add_circle_rounded)),
              BottomNavigationBarItem(
                  label: "Cart", icon: Icon(Icons.shopping_cart)),
              BottomNavigationBarItem(
                  label: "My Account", icon: Icon(Icons.person)),
            ]),
        body: _tabs[_currIndex]);
  }
}
