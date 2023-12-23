/*

    Next Session
      => Implement API
      => Implement State Managment

    Next Session
      => Continue with API & State Managment
      => Responsive Screens
      => Releasing APK 

    Next Session 
      => Say Good Bye
      => Simple Products APP ( Graduation )
    
*/


import 'package:flutter/material.dart';
import 'package:i_services/screens/bottom_navigation_screen.dart';
import 'package:i_services/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isLogged = false;

  @override
  void initState() {
    verify();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogged ? BottomNavigationScreen() : LoginScreen(),
    );
  }

  verify() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      bool? logged = sharedPreferences.getBool('isLoggedIn');
      setState(() {
        isLogged = logged!;
      });
    } catch (e) {
      setState(() {
        isLogged = false;
      });
    }
  }
}