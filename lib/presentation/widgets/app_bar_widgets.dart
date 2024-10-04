import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          kwidth,
          Text(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
        const   Spacer(),
          Icon(
            Icons.cast,
            color: Colors.white,
            size: 30,
          ),
          kwidth,
          Container(
            width: 30,
            height: 30,
            color: Colors.blue,
          ),
          kwidth,
        ],
      ),
    );
  }
}
