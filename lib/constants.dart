import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();

// BottomNavbar
Color unselectedIconColor = const Color(0xffdedde3);

// User Profile
String name = "Hideo Bojima";
String gender = "Male";
String idNumber = "00420420";
String age = "58";

// dose
int initialDose = 3;

// Card Content
bool idIsVisible = false;
bool artTestNegativeBool = true;
bool onlyShowLastVac = true;
String dateTime = DateFormat('dd MMM yyyy HH:mm').format(now).toString();
List<String> cardCode = ["GREEN", "YELLOW", "RED", "PURPLE", "BLUE"];
int initialCardCode = 0;

// Premise Content
String premiseName = "Bojima Productions Office";

// Bottom Card Section
double buttonFontSize = 12.0;
Color bottomInnerIconColor = const Color(0xff0fc1a1);
Color scanCodeIconColor = const Color(0xffe7faf8);
Color healthCodeIconColor = const Color(0xffe7faf8);
Color artIconColor = const Color(0xffe7faf8);

// Wave Color
List<List<Color>> initialWaveColor = greenWave;
Color initialBackground = greenBackground;

//----GREEN
List<List<Color>> greenWave = const [
  [Color(0xEE4bae78), Color(0xff357b54)],
  [Color(0xEE4cb27a), Color(0xff2b6545)],
  [Color(0xEE6dffc2), Color(0xff2a6143)],
  [Color(0xEE57cc9b), Color(0xff367f60)],
];
Color greenBackground = const Color(0xff4bae78);

//----YELLOW
List<List<Color>> yellowWave = const [
  [Color(0xeeae804b), Color(0xff7b5835)],
  [Color(0xeeb27f4c), Color(0xff65452b)],
  [Color(0xeeffbb6d), Color(0xff61412a)],
  [Color(0xeecc9557), Color(0xff7a4e37)],
];
Color yellowBackground = const Color(0xffffa221);

//----RED
List<List<Color>> redWave = const [
  [Color(0xeeae4b4b), Color(0xff7b3535)],
  [Color(0xeeb24c4c), Color(0xff652b2b)],
  [Color(0xeeff6d6d), Color(0xff612a2a)],
  [Color(0xeecc5757), Color(0xff7f3636)],
];
Color redBackground = const Color(0xffe76464);

//----BLUE
List<List<Color>> blueWave = const [
  [Color(0xee4b6eae), Color(0xff35497b)],
  [Color(0xee4c75b2), Color(0xff2b4465)],
  [Color(0xee6dacff), Color(0xff2a4661)],
  [Color(0xee5786cc), Color(0xff36507f)],
];
Color blueBackground = const Color(0xff4b8bae);

//----PURPLE
List<List<Color>> purpleWave = const [
  [Color(0xee936cff), Color(0xff46357b)],
  [Color(0xeeaf83ff), Color(0xff382b65)],
  [Color(0xee7c6dff), Color(0xff3a2a61)],
  [Color(0xee7857cc), Color(0xff46367f)],
];
Color purpleBackground = const Color(0xff7e4bae);

// Vaccination Section
double vacFontSize = 12.0;
Color appointmentIconColor = const Color(0xff2fc2bc);
Color certificateIconColor = const Color(0xff746385);
Color reportingIconColor = const Color(0xfffd7e85);

// Services Section
double serviceFontSize = 12.0;
Color homeIsoIconColor = const Color(0xff76a9ea);
Color epidemicMapIconColor = const Color(0xfffbc251);
Color selfAssessIconColor = const Color(0xff2fc2bc);
Color tipIconColor = const Color(0xff746385);
Color bruneiIconColor = const Color(0xfffd7e85);

//Misc
double heightSizedBox = 6.0;
Color textColorOne = Colors.grey;
Color cardShadowColor = const Color(0xffe8e8e8);
var pi = 3.14; // for icon rotation

// ordinals
List<String> ordinals = ['st', 'nd', 'rd', 'th'];
int ordinalIndex = 0;
