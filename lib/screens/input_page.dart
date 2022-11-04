import 'package:bmi_calculator/app_colors.dart';
import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/bmi_widgets/bmi_content_control.dart';
import 'package:bmi_calculator/bmi_widgets/bmi_large_button.dart';
import 'result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/bmi_widgets/bmi_icon_content.dart';
import 'package:bmi_calculator/bmi_widgets/bmi_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:share_plus/share_plus.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

  Color getCardColor(Gender gender) {
    return gender == selectedGender ? AppColors.accent : AppColors.primary;
  }

  Color getLabelColor(Gender gender) {
    return gender == selectedGender ? Colors.white : AppColors.secondary;
  }

  // input: 1 for male, and 2 for female
  void selectGender(Gender gender) {
    setState(() {
      //toggle gender
      selectedGender = selectedGender == gender ? null : gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.menu),
              onSelected: (Menu item) {
                if (item == Menu.Share) {
                  Share.share(
                    'Check out my website',
                  );
                }
              },
              itemBuilder: (context) => <PopupMenuItem<Menu>>[
                    PopupMenuItem<Menu>(
                      value: Menu.Share,
                      child: Text('Share with a Friend'),
                    ),
                    PopupMenuItem<Menu>(
                      value: Menu.Rate,
                      child: Text('Rate this App'),
                    ),
                    PopupMenuItem<Menu>(
                      value: Menu.MoreApps,
                      child: Text('More Apps'),
                    ),
                    PopupMenuItem<Menu>(
                      value: Menu.Settings,
                      child: Text('Settings'),
                    ),
                    PopupMenuItem<Menu>(
                      value: Menu.Exit,
                      child: Text('Exit'),
                    ),
                  ])
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 12,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: BMICard(
                        onSelect: () {
                          selectGender(Gender.male);
                        },
                        color: getCardColor(Gender.male),
                        child: BMIconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                          labelColor: getLabelColor(Gender.male),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: BMICard(
                        onSelect: () {
                          selectGender(Gender.female);
                        },
                        color: getCardColor(Gender.female),
                        child: BMIconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                          labelColor: getLabelColor(Gender.female),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Expanded(
                flex: 2,
                child: BMICard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kValueStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15,
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 30,
                          ),
                        ),
                        child: Slider(
                            min: kMinHeight,
                            max: kMaxHeight,
                            value: height.toDouble(),
                            activeColor: AppColors.accent,
                            inactiveColor: AppColors.secondary,
                            onChanged: (newHeight) {
                              setState(() {
                                height = newHeight.round();
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: BMICard(
                        child: BMIContentControl(
                          label: 'WEIGHT',
                          value: weight,
                          unit: 'kg',
                          onDecrease: () => setState(() => weight--),
                          onIncrease: () => setState(() => weight++),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: BMICard(
                        child: BMIContentControl(
                          label: 'AGE',
                          value: age,
                          onDecrease: () => setState(() => age--),
                          onIncrease: () => setState(() => age++),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              BMILargeButton(
                  text: 'CALCULATE',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          BMICalculator bmiCalc =
                              BMICalculator(height: height, weight: weight);

                          return ResultPage(
                            bmiResults: bmiCalc,
                          );
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
