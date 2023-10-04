import 'package:bmi_calculator/screens/input_page/widgets/body_parameter.dart';
import 'package:bmi_calculator/screens/input_page/widgets/box_card.dart';
import 'package:bmi_calculator/screens/input_page/widgets/buttom_button.dart';
import 'package:bmi_calculator/screens/input_page/widgets/height_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../styles/constants.dart';
import '../input_page/widgets/box_card.dart';
import '../input_page/widgets/gender_selector.dart';

enum Genders {
  male,
  female,
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Genders selectedGender = Genders.male;
  int heightValue = 180;
  int weightValue = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BoxCard(
                    color: setMaleCardColor(),
                    onTap: () {
                      setState(() {
                        selectedGender = Genders.male;
                      });
                    },
                    childWidget: GenderSelector(
                        genderIcon: FontAwesomeIcons.mars, genderText: 'MALE'),
                  ),
                ),
                Expanded(
                  child: BoxCard(
                      onTap: () {
                        setState(() {
                          selectedGender = Genders.female;
                        });
                      },
                      color: selectFemaleCardColor(),
                      childWidget: GenderSelector(
                          genderIcon: FontAwesomeIcons.venus,
                          genderText: 'FEMALE')),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BoxCard(
                    color: kWidgetBackgroundColor,
                    childWidget: HeightSelector(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BoxCard(
                    color: kWidgetBackgroundColor,
                    childWidget: BodyParameterWidget(80, 'WEIGHT'),
                  ),
                ),
                Expanded(
                  child: BoxCard(
                    color: kWidgetBackgroundColor,
                    childWidget: BodyParameterWidget(20, 'AGE'),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonText: 'CALCULATE', navigationTarget: '/results'),
        ],
      ),
    );
  }

  Color selectFemaleCardColor() {
    return selectedGender == Genders.female
        ? kWidgetActiveColor
        : kWidgetBackgroundColor;
  }

  Color setMaleCardColor() {
    return selectedGender == Genders.male
        ? kWidgetActiveColor
        : kWidgetBackgroundColor;
  }
}
