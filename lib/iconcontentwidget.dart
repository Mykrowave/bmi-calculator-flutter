import 'package:flutter/material.dart';

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