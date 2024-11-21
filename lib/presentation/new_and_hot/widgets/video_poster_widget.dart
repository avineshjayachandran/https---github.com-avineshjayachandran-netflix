import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    super.key, required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
              width: double.infinity,
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>const Center(child: CircularProgressIndicator(strokeWidth: 2,),),
                    errorWidget: (context, url, error) =>const Icon(
                      Icons.error,color: Colors.red,
                    ),
                  ),
                     Positioned(
              bottom: 5,
              right: 5,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: KBlackColor,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off_rounded,
                    color: kWhiteColor,
                    size: 20,
                  ),
                ),
              ),
            ),
                ],
              ),
            ),
      ],
    );
     
      
    
  }
}
