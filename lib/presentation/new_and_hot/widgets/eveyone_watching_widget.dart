import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/core/colors/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';
import 'package:netflix/presentation/home/widgets/custom_widget_home.dart';

class EveryOneWatchingWidget extends StatelessWidget {
   final String posterPath;
  final String movieName;
  final String description;
  const EveryOneWatchingWidget({
    super.key, required this.posterPath, required this.movieName, required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight10,
        Text(
         movieName ,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
       const SizedBox(
          height: 5,
        ),
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style:const TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(
          height: 20,
        ),
        CachedNetworkImage(
          imageUrl: '$ImageAppendUrl$posterPath',
          width: double.infinity,
          height: 380,
          fit: BoxFit.fill,
                    placeholder: (context, url) =>const Center(child: CircularProgressIndicator(strokeWidth: 2,),),
                    errorWidget: (context, url, error) {
                      print('Error loading image: $error');
                   return const Icon(Icons.error, color: Colors.red);
                    }
        ),
        kheight20,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.share,
              title: 'Share',
              Iconsize: 35,
              Textcolor: Colors.grey,
              Textsize: 18,
              divisionheight: 10,
            ),
            kwidth,
            CustomButton(
              icon: Icons.add,
              title: 'My List',
              Iconsize: 35,
              Textcolor: Colors.grey,
              Textsize: 18,
              divisionheight: 10,
            ),
            kwidth,
            CustomButton(
              icon: Icons.play_arrow,
              title: 'Play',
              Iconsize: 35,
              Textcolor: Colors.grey,
              Textsize: 18,
              divisionheight: 10,
            ),
            kwidth
          ],
        )
      ],
    );
  }
}
