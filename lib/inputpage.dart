import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class IconContentWidget extends StatelessWidget {
  final IconData iconData;
  final String contentTitle;
  const IconContentWidget(
      {Key key, @required this.iconData, @required this.contentTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          contentTitle,
          style: TextStyle(
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}

class BMIWidget extends StatelessWidget {
  final Color color;
  final Widget child;
  static const Color defaultColor = Color(0xFF1D1E33);
  const BMIWidget({Key key, this.child, this.color = defaultColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}

//0xFF1D1E33
