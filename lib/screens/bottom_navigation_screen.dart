import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_services/cubits/navigation_cubit.dart';
import 'package:i_services/shared/shared_theme/shared_colors.dart';
import 'package:i_services/shared/shared_theme/shared_fonts.dart';
import 'package:i_services/states/navigation_states.dart';


class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationStates>(
      builder: (context, state) => Scaffold(
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
          currentIndex: BlocProvider.of<NavigationCubit>(context).selectedIndex,
          onTap: (index) {
            BlocProvider.of<NavigationCubit>(context).changeScreen(index);
          },
        ),
        body: BlocProvider.of<NavigationCubit>(context).screens[BlocProvider.of<NavigationCubit>(context).selectedIndex]
      ),
    );
  }
}