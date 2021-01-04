import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final double width;
  final Color bgColor;
  final Color txtColor;
  final GestureTapCallback onPressed;

  const MyButton(
      {Key key,
      this.buttonText,
      this.width,
      this.bgColor,
      this.txtColor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: width,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: onPressed,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: bgColor,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: txtColor,
            fontSize: 18.0,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
