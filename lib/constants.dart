import 'package:bmi_calculator/app_colors.dart';
import 'package:flutter/material.dart';

//icon size
const double kIconSize = 80;

//gab size between icon and its label
const double kGabSize = 10;

//label text style
const TextStyle kLabelStyle =
    TextStyle(fontSize: 22, color: AppColors.secondary);

//value text style
const TextStyle kValueStyle = TextStyle(
  fontSize: 55,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);

//min Height
const double kMinHeight = 120.0;
//max Height
const double kMaxHeight = 220.0;

//Main App Theme
final ThemeData kAppTheme = ThemeData.dark().copyWith(
  platform: TargetPlatform.iOS,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.accent,
    onPrimary: AppColors.secondary,
  ),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      color: AppColors.secondary,
    ),
  ),
  scaffoldBackgroundColor: AppColors.primary,
);

//App title
const String kAppTitle = 'BMI CALCULATOR';

//Test style for BMILargeButton
const TextStyle kLargeButtonTextStyle =
    TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);

const TextStyle kLargeTextStyle = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const TextStyle kResultLabelTextStyle = TextStyle(
  fontSize: 26,
  color: AppColors.accent,
  fontWeight: FontWeight.bold,
);
const TextStyle kResultValueTextStyle = TextStyle(
  fontSize: 80,
  color: Colors.white,
  fontWeight: FontWeight.w800,
);

enum Menu { Share, Rate, MoreApps, Settings, Exit }
