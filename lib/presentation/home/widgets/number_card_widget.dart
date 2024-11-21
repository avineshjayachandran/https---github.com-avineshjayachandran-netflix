import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/home/widgets/home_title.dart';
import 'package:netflix/presentation/home/widgets/numberCard.dart';

class numbercardwidget extends StatelessWidget {
  const numbercardwidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight10,
          MainTitle(title: title),
          kheight10,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    10,
                    (index) => Numbercard(
                          index: index,
                        ))),
          )
        ],
      ),
    );
  }
}
