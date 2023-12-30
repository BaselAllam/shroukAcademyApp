


import 'package:flutter/material.dart';

double responsiveHomeGrid(double screenHeight) {

  if (screenHeight <= 550) {
    return 200;
  } else {
    return 440;
  }
}


double responsiveHomeGridItem(double screenHeight) {

  if (screenHeight <= 550) {
    return 0.8;
  } else {
    return 1.0;
  }
}


double responsiveFacultyDetailsDepart(double screenHeight) {

  if (screenHeight <= 550) {
    return 0.9;
  } else {
    return 1.15;
  }
}


double responsiveFacultyDetailsAbout(double screenHeight) {

  if (screenHeight <= 550) {
    return 1.5;
  } else {
    return 2.9;
  }
}


Size responsiveFacultyGridImg(double screenHeight) {

  if (screenHeight >= 900) {
    return Size(200, 200);
  } else {
    return Size(145, 105.0);
  }
}