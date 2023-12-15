import 'package:flutter/material.dart';
import 'package:i_services/shared/shared_theme/shared_colors.dart';
import 'package:i_services/shared/shared_theme/shared_fonts.dart';



field(
  String labelTxt, IconData prefixIcon, TextEditingController controller, TextInputAction inputAction, TextInputType type,
  {bool isSecure = false, Widget suffixWidget = const SizedBox()}
  ) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextField(
      decoration: InputDecoration(
        border: inputBorder(SharedColors.primaryColor),
        enabledBorder: inputBorder(SharedColors.primaryColor),
        focusedBorder: inputBorder(SharedColors.primaryColor),
        errorBorder: inputBorder(Colors.red),
        labelText: labelTxt,
        labelStyle: SharedFonts.miniFontPrimaryColor,
        prefixIcon: Icon(prefixIcon, color: SharedColors.secondaryColor),
        suffixIcon: suffixWidget
      ),
      textInputAction: inputAction,
      keyboardType: type,
      controller: controller,
      obscureText: isSecure,
    ),
  );
}

OutlineInputBorder inputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(color: color, width: 0.5)
  );
}