/*

    Faculty Details ( About & Submit button & Teachers ( List of teaches with pics, short bio ) )
    Login Screen


    Next Session
      => Faculty Details
      => Input & Fields
      => Buttons

    Next Session
      => Dialog 
      => Integrate Google Maps
      => Integrate Firebase
      => Front-end & Back-end & API

    Next Session
      => Intro To State Managment
      => Difference Between Approaches

    Next Session
      => Implement API
      => Implement State Managment

    Next Session
      => Continue with API & State Managment
      => Responsive Screens
      => Releasing APK 

    Next Session 
      => Say Good Bye
    
*/


import 'package:flutter/material.dart';
import 'package:i_services/screens/bottom_navigation_screen.dart';


void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationScreen(),
      // routes: {
      //   'home': (context) => HomeScreen(),
      //   'about': (context) => AboutAcademyScreen(),
      // },
    );
  }
}