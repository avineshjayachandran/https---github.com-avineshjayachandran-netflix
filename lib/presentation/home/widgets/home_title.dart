import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  final String title;
  const MainTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 23),
    );
  }
}
