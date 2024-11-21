import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.icon,
      required this.title,
      this.Iconsize = 20,
      this.Textsize = 18,
      this.Textcolor = Colors.white,
      this.Textspacing = 0,
      this.divisionheight = 0});
  final IconData icon;
  final String title;
  final double Iconsize;
  final double Textsize;
  final Color Textcolor;
  final double Textspacing;
  final double divisionheight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: Iconsize,
        ),
        SizedBox(
          height: divisionheight,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: Textsize, color: Textcolor, letterSpacing: Textspacing),
        )
      ],
    );
  }
}

TextButton playButton() {
  return TextButton.icon(
    onPressed: () {},
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        'play',
        style: TextStyle(
            color: KBlackColor, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ),
    icon: const Icon(
      Icons.play_arrow_sharp,
      color: KBlackColor,
      size: 25,
    ),
    style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(kWhiteColor),
        shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
  );
}
