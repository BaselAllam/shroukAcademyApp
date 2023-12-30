import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_services/cubits/navigation_cubit.dart';
import 'package:i_services/screens/bottom_navigation_screen.dart';
import 'package:i_services/screens/login_screen.dart';
import 'package:i_services/shared/shared_theme/shared_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.whiteColor,
      body: FutureBuilder(
        future: verify(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return BottomNavigationScreen();
          } else {
            return LoginScreen();
          }
        },
        initialData: Center(
          child: Image.asset(
            'assets/logo.png',
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 2,
          )
        ),
      ),
    );
  }

  Future<bool> verify() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      bool? logged = sharedPreferences.getBool('isLoggedIn');
      if (logged! == true) {
        BlocProvider.of<NavigationCubit>(context).initCubit();
      }
      return logged;
    } catch (e) {
      return false;
    }
  }
}