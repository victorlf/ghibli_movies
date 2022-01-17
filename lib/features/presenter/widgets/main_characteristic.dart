import 'package:flutter/material.dart';

class MainCharacteristic extends StatelessWidget {
  final String title;
  final String content;
  const MainCharacteristic(
      {Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(content),
      ],
    );
  }
}
