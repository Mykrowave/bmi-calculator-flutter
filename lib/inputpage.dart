import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmiwidget.dart';
import 'iconcontentwidget.dart';

const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color _currentMaleColor = inActiveCardColor;
  Color _currentFemaleColor = inActiveCardColor;
  double _sliderValue = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: BMIWidget(
                      onTapCall: () {
                        setState(() {
                          genderWidgetSelected(Gender.male);
                        });
                      },
                      color: _currentMaleColor,
                      child: IconContentWidget(
                        iconData: FontAwesomeIcons.mars,
                        contentTitle: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: BMIWidget(
                      onTapCall: () {
                        setState(() {
                          genderWidgetSelected(Gender.female);
                        });
                      },
                      color: _currentFemaleColor,
                      child: IconContentWidget(
                        iconData: FontAwesomeIcons.venus,
                        contentTitle: 'FEMALE',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: BMIWidget(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: klabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                _sliderValue.round().toString(),
                                style: TextStyle(fontSize: 50.0),
                              ),
                              Text(
                                'cm',
                                style: klabelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Color(0xFFEb1555),
                              overlayColor: Color(0x29Eb1555),
                              thumbColor: Color(0xFFEb1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 18.0),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 30.0
                              )
                            ),
                            child: Slider(
                              //inactiveColor: inActiveCardColor,
                              min: 100.0,
                              max: 300.0,
                              value: _sliderValue,
                              onChanged: (sv) {
                                setState(() {
                                  _sliderValue = sv;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: BMIWidget(),
                  ),
                  Expanded(
                    child: BMIWidget(),
                  )
                ],
              ),
            ),
            Container(
              color: Color(0xFFEb1555),
              width: double.infinity,
              margin: EdgeInsets.only(top: 8.0),
              height: 80.0,
              child: Center(
                child: Text('CALCULATE'),
              ),
            ),
          ],
        ));
  }

  void genderWidgetSelected(Gender genderSelected) {
    _currentMaleColor = genderSelected == Gender.male
        ? _currentMaleColor = activeCardColor
        : _currentMaleColor = inActiveCardColor;
    _currentFemaleColor = genderSelected == Gender.female
        ? _currentFemaleColor = activeCardColor
        : _currentFemaleColor = inActiveCardColor;
  }
}

enum Gender { male, female }
