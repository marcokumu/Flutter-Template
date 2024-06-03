import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class NumberPad extends StatelessWidget {
  final Function(int) onInputNumber;
  final VoidCallback onClearLastInput;
  final VoidCallback onClearAll;

  const NumberPad({
    Key? key,
    required this.onInputNumber,
    required this.onClearLastInput,
    required this.onClearAll,
  }) : super(key: key);

  Widget buildNumeralRow(List<int> numbers) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: numbers
            .map((number) => Expanded(
                child: Numeral(number: number, onKeyPress: onInputNumber)))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildNumeralRow([1, 2, 3]),
        buildNumeralRow([4, 5, 6]),
        buildNumeralRow([7, 8, 9]),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Expanded(
                child: Numeral(number: 0, onKeyPress: onInputNumber),
              ),
              Expanded(
                child: ClearButton(
                  onClearLastInput: onClearLastInput,
                  onClearAll: onClearAll,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Numeral extends StatelessWidget {
  final int number;
  final Function(int) onKeyPress;

  const Numeral({
    Key? key,
    required this.number,
    required this.onKeyPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () => onKeyPress(number),
      child: Text(
        '$number',
        style: TextStyle(
          fontSize: screenWidth * 0.1,
        ),
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  final VoidCallback onClearLastInput;
  final VoidCallback onClearAll;

  const ClearButton({
    Key? key,
    required this.onClearLastInput,
    required this.onClearAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClearLastInput,
      icon: const Icon(MingCute.delete_back_line),
      // onLongPress: onClearAll,
    );
  }
}
