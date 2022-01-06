import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.FEMALE;
  int height = 180;

  void updateGender(Gender gender) {
    setState(() {
      this.gender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Can be done simply without this generic typing
    // but this is just for me to know how to extract types
    // rather than typing it as we define
    final ValueChanged<double> handleHeightChange = (double height) {
      setState(() {
        this.height = height.round();
      });
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () => updateGender(Gender.MALE),
                    color: gender == Gender.MALE
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () => updateGender(Gender.FEMALE),
                    color: gender == Gender.FEMALE
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text('cm', style: kLabelTextStyle),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xffEB1555),
                    inactiveColor: Color(0xff8D8E98),
                    onChanged: handleHeightChange,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(color: kActiveCardColor)),
                Expanded(child: ReusableCard(color: kActiveCardColor)),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            width: double.infinity,
            height: kBottomContainerHeight,
            margin: EdgeInsets.only(top: 10),
          ),
        ],
      ),
    );
  }
}
