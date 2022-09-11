import 'package:flutter/material.dart';


//blue theme
// const kWhite = Color.fromARGB(255, 223, 228, 255);
// const konBoardingmain = Color.fromARGB(255, 208, 249, 239);
// const konBoardingsecondary = Color.fromARGB(255, 11, 57, 79);
// const konBoardingtertiary = Color.fromARGB(255, 3, 26, 31);

//green theme
const kWhite = Color.fromARGB(255, 242, 255, 223);
const konBoarding = Color.fromARGB(255, 34, 64, 0);
const konBoardingmain = Color.fromARGB(255, 223, 250, 186);
const konBoardingsecondary = Color.fromARGB(255, 47, 74, 0);
const konBoardingtertiary = Color.fromARGB(255, 18, 21, 14);

//red theme
// const kWhite = Color.fromARGB(255, 255, 223, 223);
// const konBoarding = Color.fromARGB(255, 64, 0, 0);
// const konBoardingmain = Color.fromARGB(255, 250, 186, 186);
// const konBoardingsecondary = Color.fromARGB(255, 74, 0, 0);
// const konBoardingtertiary = Color.fromARGB(255, 21, 14, 14);

// yellow theme
// const kWhite = Color.fromARGB(255, 255, 251, 223);
// const konBoarding = Color.fromARGB(255, 64, 49, 0);
// const konBoardingmain = Color.fromARGB(255, 255, 232, 150);
// const konBoardingsecondary = Color.fromARGB(255, 74, 55, 0);
// const konBoardingtertiary = Color.fromARGB(255, 21, 19, 14);

//purple theme
// const kWhite = Color.fromARGB(255, 236, 223, 255);
// const konBoarding = Color.fromARGB(255, 32, 0, 64);
// const konBoardingmain = Color.fromARGB(255, 223, 190, 255);
// const konBoardingsecondary = Color.fromARGB(255, 41, 0, 74);
// const konBoardingtertiary = Color.fromARGB(255, 18, 14, 21);



const font = 'SF Pro Display';
const font1 = 'SF Pro Rounded';
const f2 = FontWeight.bold;
const f1 = FontWeight.w500;
const f0 = FontWeight.normal;
const kcardbuttontexth3 =
    TextStyle(fontFamily: font1, fontWeight: f0, color: kWhite,fontSize: 18);
const kcardbuttontexth1 =
    TextStyle(fontFamily: font1, fontWeight: f2, color: kWhite,fontSize: 18);
const kcardbuttontexth2 =
    TextStyle(fontFamily: font1, fontWeight: f0, color: kWhite,fontSize: 14);
const kcardbuttontext =
    TextStyle(fontFamily: font1, fontWeight: f2, color: konBoardingsecondary);
const kBlack = konBoardingtertiary;

// const kWhite = Color.fromARGB(255, 250, 255, 224);
const kgrey = Color.fromARGB(255, 53, 53, 53);
const ktabbarcontainer = BoxDecoration(
  color: kgrey,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
  ),
);

Color nameColor = Color(0xFF3F455A);
Color ratingCol = Color(0XFFEF544A);



TextStyle rating = TextStyle(
  color: kWhite,
  fontFamily: font1,
  fontWeight: FontWeight.bold,
  fontSize: 25,
);

TextStyle gameName = TextStyle(
  letterSpacing: 1.0,
  fontFamily: font1,
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: kWhite,
);

TextStyle charName = TextStyle(
  fontFamily: font1,
  fontSize: 40.0,
  
  color: konBoardingmain,
);



