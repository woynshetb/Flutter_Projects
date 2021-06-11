import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results_page.dart';
import '../component/icon_Content.dart';
import '../component/reusable_Card.dart';
import '../constants.dart';
import '../component/bottom_button.dart';
import '../component/round_icon.dart';
import '../calculator_brain.dart';

enum Gender {
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? KActiveColor
                      : KInactiveColor,
                  cardChild:
                      CustomIcon(icon: FontAwesomeIcons.mars, label: 'Male'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? KActiveColor
                      : KInactiveColor,
                  cardChild:
                      CustomIcon(icon: FontAwesomeIcons.venus, label: 'Female'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: KActiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: KLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: KNumberingTextStyle,
                    ),
                    Text(
                      'cm',
                      style: KLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 300.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: KActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Weight',
                        style: KLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            weight.toString(),
                            style: KNumberingTextStyle,
                          ),
                          Text(
                            'KG',
                            style: KLabelTextStyle,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundeIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight = weight - 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundeIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight = weight + 1;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: ReusableCard(
                  colour: KActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: KLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: KNumberingTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundeIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age = age - 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundeIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age = age + 1;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomButton(
          buttonTitle: 'CALCULATE',
          onTab: () {
            CalulatorBrain calc =
                CalulatorBrain(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RessultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              );
            }));
          },
        )
      ]),
    );
  }
}
