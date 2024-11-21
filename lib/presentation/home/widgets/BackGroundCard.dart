import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/widgets/custom_widget_home.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w220_and_h330_face/aosm8NMQ3UyoBVpSxyimorCQykC.jpg"),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButton(icon: Icons.add, title: 'My List'),
              playButton(),
              const CustomButton(icon: Icons.info_outline, title: 'info')
            ],
          ),
        )
      ],
    );
  }
}
