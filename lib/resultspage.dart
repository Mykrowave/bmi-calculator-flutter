import 'package:bmi_calculator/bmiwidget.dart';
import 'package:flutter/material.dart';

import 'models/Results.dart';

class ResultPage extends StatelessWidget {

  final BMIResult bmiResult;


  const ResultPage({Key key, this.bmiResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Result Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Text('Your Result',
                  style: Theme.of(context).textTheme.display1),
            ),
            Expanded(
              flex: 7,
              child: BMIWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                    ),
                    Text(bmiResult.category.toUpperCase()),
                    Text(bmiResult.bmiValue, style: Theme.of(context).textTheme.display4),
                    Text(bmiResult.adviceMessage,
                        style: Theme.of(context).textTheme.body2)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Color(0xFFEb1555),
                width: double.infinity,
                margin: EdgeInsets.only(top: 8.0),
                height: 80.0,
                child: Center(
                  child: Text('RE-CALCULATE'),
                ),
              ),
            ),
          ],
        ));
  }
}
