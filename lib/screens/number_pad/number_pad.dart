import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class NumberPad extends StatelessWidget {
  final Function(int) onNumberInput;
  final VoidCallback onClearLastInput;
  final VoidCallback onClearAll;

  const NumberPad({
    Key? key,
    required this.onNumberInput,
    required this.onClearLastInput,
    required this.onClearAll,
  }) : super(key: key);

  Widget _buildNumeralRow(List<int> numbers) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: numbers
            .map((number) => Expanded(
                  child: NumeralButton(
                    number: number,
                    onPressed: () => onNumberInput(number),
                  ),
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildNumeralRow([1, 2, 3]),
        _buildNumeralRow([4, 5, 6]),
        _buildNumeralRow([7, 8, 9]),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Expanded(
                child: NumeralButton(
                  number: 0,
                  onPressed: () => onNumberInput(0),
                ),
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

class NumeralButton extends StatelessWidget {
  final int number;
  final VoidCallback onPressed;

  const NumeralButton({
    Key? key,
    required this.number,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        '$number',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.1,
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
    );
  }
}
