import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';

class Main_card extends StatelessWidget {
  final String imageUrl;
  const Main_card({
    super.key, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.topLeft,
      width: 150,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: kBradius18,
          image: DecorationImage(
              image: NetworkImage(
                 imageUrl))),
    );
  }
}
