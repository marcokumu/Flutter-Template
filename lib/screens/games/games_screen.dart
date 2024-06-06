import 'package:flutter/material.dart';
import 'package:flutter_template/screens/number_pad/number_pad.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});
  static final TextEditingController _controller = TextEditingController();

  void inputNumber(int value) {
    _controller.text += value.toString();
  }

  void clearLastInput() {
    if (_controller.text.isNotEmpty) {
      _controller.text =
          _controller.text.substring(0, _controller.text.length - 1);
    }
  }

  void clearAll() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Games', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent[700],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                autofocus: true,
                showCursor: true,
                style: TextStyle(
                  fontSize: screenHeight * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                keyboardType: TextInputType.none,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    prefixText: 'KSH. '),
                scrollPadding: const EdgeInsets.all(20.0),
              ),
              SizedBox(
                height: screenHeight * 0.6,
                child: NumberPad(
                  onNumberInput: inputNumber,
                  onClearLastInput: clearLastInput,
                  onClearAll: clearAll,
                ),
              ),
            ],
          ),
        ));
  }
}
