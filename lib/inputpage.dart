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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          genderWidgetSelected(Gender.male);
                        });
                      },
                      child: BMIWidget(
                        color: _currentMaleColor,
                        child: IconContentWidget(
                          iconData: FontAwesomeIcons.mars,
                          contentTitle: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          genderWidgetSelected(Gender.female);
                        });
                      },
                      child: BMIWidget(
                        color: _currentFemaleColor,
                        child: IconContentWidget(
                          iconData: FontAwesomeIcons.venus,
                          contentTitle: 'FEMALE',
                        ),
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
                    child: BMIWidget(),
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
