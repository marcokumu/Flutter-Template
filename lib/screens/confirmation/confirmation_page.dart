import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConfirmationPage extends StatelessWidget {
  final bool isSuccess;

  const ConfirmationPage({Key? key, required this.isSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Lottie.asset('assets/lottie/success.json')),
            SizedBox(height: 20),
            Text(
              'Transaction Successful',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
