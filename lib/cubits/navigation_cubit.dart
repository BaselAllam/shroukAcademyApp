import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_services/cubits/utils.dart';
import 'package:i_services/screens/about_academy_screen.dart';
import 'package:i_services/screens/home_screen.dart';
import 'package:i_services/states/navigation_states.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class NavigationCubit extends Cubit<NavigationStates> {

  NavigationCubit() : super(ChangeNavigationState());

  final List<Widget> _screens = [HomeScreen(), AboutAcademyScreen()];
  List<Widget> get screens => _screens;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  List<String> _headerImgs = [];
  List<String> get headerImgs => _headerImgs;

  List<String> _academyLeaders = [];
  List<String> get academyLeaders => _academyLeaders;

  List<Map<String, dynamic>> _faculities = [];
  List<Map<String, dynamic>> get faculities => _faculities;


  void changeScreen(int index) {
    _selectedIndex = index;
    emit(ChangeNavigationState());
  }

  void initCubit() {
    getHeaderImgs();
    getLeadersImgs();
    getFaculties();
  }
  
  void getHeaderImgs() async {
    emit(GetHeaderImgsLoadingState());

    try {
      http.Response res = await http.get(Uri.parse('${SharedUtils.domain}/headerAds.json'));
      var data = json.decode(res.body);

      data.forEach((k, v) {
        _headerImgs.add(v['imgUrl']);
      });
      emit(GetHeaderImgsSuccessState());
    } catch (e) {
      emit(GetHeaderImgsErrorState());
    }
  }

  void getLeadersImgs() async {
    emit(GetLeadersImgsLoadingState());

    try {
      http.Response res = await http.get(Uri.parse('${SharedUtils.domain}/academyLeaders.json'));
      var data = json.decode(res.body);

      data.forEach((k, v) {
        _academyLeaders.add(v['leaderImg']);
      });
      emit(GetLeadersImgsSuccessState());
    } catch (e) {
      emit(GetLeadersImgsErrorState());
    }
  }

  void getFaculties() async {
    emit(GetFacultyLoadingState());

    try {
      http.Response res = await http.get(Uri.parse('${SharedUtils.domain}/facluties.json'));
      var data = json.decode(res.body);

      data.forEach((k, v) {
        _faculities.add(v);
      });
      print(_faculities);
      emit(GetFacultySuccessState());
    } catch (e) {
      emit(GetFacultyErrorState());
    }
  }
}