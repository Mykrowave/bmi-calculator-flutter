import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmiwidget.dart';
import 'iconcontentwidget.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                      child: IconContentWidget(
                        iconData: FontAwesomeIcons.mars,
                        contentTitle: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: BMIWidget(
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
            )
          ],
        ));
  }
}
