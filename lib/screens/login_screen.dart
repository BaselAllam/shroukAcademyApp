import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_services/cubits/navigation_cubit.dart';
import 'package:i_services/screens/bottom_navigation_screen.dart';
import 'package:i_services/shared/shared_theme/shared_colors.dart';
import 'package:i_services/shared/shared_theme/shared_fonts.dart';
import 'package:i_services/shared/shared_widgets/field_widget.dart';
import 'package:i_services/shared/shared_widgets/snack_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200.0,
              width: 200.0,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://www.sha.edu.eg/layout/images/logo.png'),
                  fit: BoxFit.fill
                )
              ),
            ),
            field('Email Address', Icons.email, emailController, TextInputAction.done, TextInputType.emailAddress),
            field(
              'Password',
              Icons.lock,
              passwordController,
              TextInputAction.done,
              TextInputType.text,
              isSecure: isHidden,
              suffixWidget: IconButton(
                icon: Icon(Icons.remove_red_eye),
                color: SharedColors.greyColor,
                iconSize: 20.0,
                onPressed: () {
                  isHidden = !isHidden;
                  setState(() {});
                },
              )
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              alignment: Alignment.bottomCenter,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: SharedColors.secondaryColor,
                  elevation: 0.0,
                  fixedSize: Size(150.0, 35.0),
                ),
                child: Text('Login', style: SharedFonts.miniFontWhiteColor),
                onPressed: () async {
                  if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(snack('Some Fields Required!', Colors.red));
                  } else {
                    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                    sharedPreferences.setBool('isLoggedIn', true);
                    BlocProvider.of<NavigationCubit>(context).initCubit();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavigationScreen()));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}