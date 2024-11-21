import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:bordered_text/bordered_text.dart';

class Numbercard extends StatelessWidget {
  const Numbercard({
    super.key,
    required this.index, required this.imageUrl,
  });
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double leftPosition = index == 0 ? 6 : -6;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              width: 150,
              height: 190,
              decoration: BoxDecoration(
                  borderRadius: kBradius18,
                  image:  DecorationImage(
                      image: NetworkImage(
                          imageUrl))),
            ),
          ],
        ),
        Positioned(
            left: leftPosition,
            top: 60,
            child: BorderedText(
                strokeWidth: 8.0,
                strokeColor: Colors.white,
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.none,
                      decorationColor: Colors.white,
                      color: Colors.black),
                ))),
      ],
    );
  }
}
