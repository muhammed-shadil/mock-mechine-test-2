import 'package:flutter/material.dart';

class constants {
  //===============sharedpreferences================
  static const String accessToken = 'TOKEN';
  static const String userid = 'USERID';

  //======================================
  static const Color backgroundColor = Color.fromARGB(255, 26, 27, 34);
  static const Color secodarycolor = Color.fromARGB(255, 255, 77, 103);
  static const Color fillcolor = Color.fromARGB(255, 47, 48, 55);
  static const Color white = Colors.white;
  static const Color offwhite = Color.fromARGB(255, 150, 143, 143);

// -----------------------------heights --------------------
  static const SizedBox height30 = SizedBox(
    height: 30,
  );
  static const SizedBox height20 = SizedBox(
    height: 20,
  );
  static const SizedBox height10 = SizedBox(
    height: 10,
  );
   static const SizedBox height3 = SizedBox(
    height: 3,
  );
   static const SizedBox width10 = SizedBox(
    width: 10,
  );


  static final RegExp regemail =
      RegExp(r"^[a-zA-Z0-9_\-\.\S]{4,}[@][a-z]+[\.][a-z]{2,3}$");

  static final RegExp password = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

  static final RegExp name = RegExp(r'^[A-Za-z]+$');
}
class styles {
// -----------------------------textstyles ---------------------------

  static const TextStyle fontSize20 = TextStyle(fontSize: 20);
  static const TextStyle textfieldhintstyle = TextStyle(
      color: constants.white, fontWeight: FontWeight.w300, fontSize: 18);
  static const TextStyle mainbuttontext =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400);
  static const TextStyle usernamefont =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
  static const TextStyle postlocation = TextStyle(
      color: Color.fromARGB(255, 251, 249, 249),
      fontSize: 16,
      fontWeight: FontWeight.w300);
  static const TextStyle bio = TextStyle(fontSize: 20);

 static const TextStyle popupMenuButton =  TextStyle(color: Colors.white,fontSize: 17);
}