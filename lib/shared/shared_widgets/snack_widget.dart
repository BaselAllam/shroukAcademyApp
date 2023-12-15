import 'package:flutter/material.dart';
import 'package:i_services/shared/shared_theme/shared_fonts.dart';


SnackBar snack(String title, Color backgroundColor) {
  return SnackBar(
    content: Text(title, style: SharedFonts.miniFontWhiteColor),
    duration: Duration(seconds: 4),
    backgroundColor: backgroundColor, 
  );
}