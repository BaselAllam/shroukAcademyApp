import 'package:flutter/material.dart';
import 'package:i_services/shared/shared_theme/shared_colors.dart';
import 'package:i_services/shared/shared_theme/shared_fonts.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SharedColors.primaryColor,
        title: Text(
          'Welcome!',
          style: SharedFonts.primaryFontWhiteColor
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, color: SharedColors.whiteColor, size: 30.0,),
      ),
    );
  }
}