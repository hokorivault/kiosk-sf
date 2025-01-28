import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF303f9f),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(
              height: 10.0,
            ),
            Text('Retrieving data...',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
