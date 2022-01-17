import 'package:flutter/material.dart';

class RatingScore extends StatelessWidget {
  final String score;
  const RatingScore({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            score,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          const Text(
            '/100',
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
