import 'package:flutter/cupertino.dart';

class Display extends StatefulWidget {
  _DisplayState _displayState = _DisplayState();

  void addDigit(String digit) {
    _displayState.addDigit(digit);
  }

  void deleteDigit() {
    _displayState.deleteDigit();
  }

  @override
  _DisplayState createState() => _displayState;
}

class _DisplayState extends State<Display> {
  String _digits = '';

  void addDigit(String digit) {
    setState(() {
      _digits += digit;
    });
  }

  void deleteDigit() {
    setState(() {
      _digits = _digits.substring(0, _digits.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'KSH $_digits',
      style: TextStyle(
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
