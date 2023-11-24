/*

  About Academy
    Home ( Academy Welcome Message & Faculties )
    Faculty Details ( About & Submit button )
    About Academy ( Message, Vision, Mission, Location, Contact Us )
    Teachers ( List of teaches with pics, short bio )


*/


import 'package:flutter/material.dart';
import 'package:i_services/screens/home_screen.dart';


void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}