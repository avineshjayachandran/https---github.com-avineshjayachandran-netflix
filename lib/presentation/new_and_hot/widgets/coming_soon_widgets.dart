import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_widget_home.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_poster_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movietitle;
  final String description;
  const ComingSoonWidget({
    super.key, required this.id, required this.month, required this.day, required this.posterPath, required this.movietitle, required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        kheight20,
        Row(
          children: [
             SizedBox(
              width: 50,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    month,
                    style:const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                  Text(
                    day,
                    style:const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5),
                  )
                ],
              ),
            ),
            SizedBox(
              width: size.width - 60,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoWidget(url:posterPath,),
                  kheight20,
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 160,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                           movietitle,
                           overflow: TextOverflow.clip,
                            style:const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                
                                letterSpacing: 5),
                          ),
                        ),
                      ),
                   
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            icon: Icons.notifications_none,
                            divisionheight: 5,
                            title: 'Remind Me',
                            Textsize: 12,
                            Iconsize: 25,
                            Textcolor: Colors.grey,
                          ),
                          kwidth20,
                          CustomButton(
                            icon: Icons.info_outlined,
                            divisionheight: 5,
                            title: 'info',
                            Textsize: 12,
                            Iconsize: 25,
                            Textcolor: Colors.grey,
                          ),
                          kwidth20
                        ],
                      )
                    ],
                  ),
                  kheight10,
                   Text("Coming on $day $month"),
                  kheight10,
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png',
                        ),
                      ),
                      const Text("FILM")
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                   Text(
                  movietitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                    style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
