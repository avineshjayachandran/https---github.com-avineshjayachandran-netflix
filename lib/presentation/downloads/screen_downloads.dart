import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widgets.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidgets(
              title: 'Downloads',
            )),
        body: ListView(
          children: [
            const Row(
              children: [
                kwidth,
                Icon(
                  Icons.settings,
                  color: kWhiteColor,
                ),
                kwidth,
                Text(
                  'Smart Downloads',
                  style: TextStyle(
                      color: kWhiteColor, fontWeight: FontWeight.w700),
                )
              ],
            ),
            const Text(
              'Introducing Downloads for You',
              style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
            kheight10,
            const Text(
              "we'll download a personalised selection of movies and shows for you,so there is always something to watch on your device",
              style: TextStyle(color: kWhiteColor),
            ),

            kheight10,

            Container(
               width: size.width,
               height: size.width,
               color: Colors.white,
               child: Stack(
                children: [
                  Center(child: CircleAvatar(radius: size.width * 0.35,))
                ],
               ),
            ),

            kheight20,

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                height: 45,
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
                color: kButtonColorBlue,
                onPressed: () {},
                child:const Text(
                  'Set Up',
                  style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: MaterialButton(
                height: 45,
                minWidth: 60,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                color: KButtonColorWhite,
                onPressed: () {},
                child:const Text(
                  'See What You Can Download',
                  style: TextStyle(
                      color: KBlackColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ));
  }
}
