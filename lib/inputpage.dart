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
  // Color _currentMaleColor = inActiveCardColor;
  // Color _currentFemaleColor = inActiveCardColor;
  Gender _genderSelected;
  double _sliderValue = 200.0;
  int _weight = 90;
  int _age = 20;

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
                      color: _genderSelected == Gender.male
                          ? activeCardColor
                          : inActiveCardColor,
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
                      color: _genderSelected == Gender.female
                          ? activeCardColor
                          : inActiveCardColor,
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
                                    overlayRadius: 30.0)),
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
                    child: BMIWidget(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: klabelTextStyle,
                          ),
                          Text(
                            _weight.toString(),
                            style: TextStyle(fontSize: 50.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SquareRoundedIncrementButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressedHandler: () {
                                  setState(() {
                                   incrementWeight(-1); 
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              SquareRoundedIncrementButton(
                                iconData: FontAwesomeIcons.plus,
                                onPressedHandler: () {
                                  setState(() {
                                    incrementWeight(1);
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BMIWidget(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: klabelTextStyle,
                          ),
                          Text(
                            _age.toString(),
                            style: TextStyle(fontSize: 50.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SquareRoundedIncrementButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressedHandler: () {
                                  setState(() {
                                   incrementAge(-1); 
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              SquareRoundedIncrementButton(
                                iconData: FontAwesomeIcons.plus,
                                onPressedHandler: () {
                                  setState(() {
                                    incrementAge(1);
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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

  void incrementWeight(int value)
  {
    if (_weight <= 0 || _weight >= 1000)
      return;
    _weight += value;
  }
  void  incrementAge(int value){
    if (_age <= 1 || _age >= 130)
      return;

    _age += value;
  }

  void genderWidgetSelected(Gender genderSelected) {
    _genderSelected = genderSelected;
  }
}

class SquareRoundedIncrementButton extends StatelessWidget {
  final Function onPressedHandler;
  final IconData iconData;

  const SquareRoundedIncrementButton(
      {Key key, @required this.onPressedHandler, @required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressedHandler,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56),
      fillColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}

enum Gender { male, female }
