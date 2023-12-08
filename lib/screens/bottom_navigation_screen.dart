import 'package:flutter/material.dart';
import 'package:i_services/screens/about_academy_screen.dart';
import 'package:i_services/screens/home_screen.dart';
import 'package:i_services/shared/shared_theme/shared_colors.dart';
import 'package:i_services/shared/shared_theme/shared_fonts.dart';



class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  int selectedIndex = 0;

  final List<Widget> screens = [HomeScreen(), AboutAcademyScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SharedColors.primaryColor,
        title: Text(
          'Ahlan!',
          style: SharedFonts.primaryFontWhiteColor
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About'
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
      body: screens[selectedIndex]
    );
  }
}