import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fastlaugh/fast_laugh_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/core/colors/strings.dart';
import 'package:netflix/domain/models/downloads/model_downloads.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

class VideoListinheritedWidget extends InheritedWidget {
  final Widget childWidget;
  final ModelDownloads movieData;

  const VideoListinheritedWidget(
      {super.key, required this.childWidget, required this.movieData})
      : super(child: childWidget);

  @override
  bool updateShouldNotify(covariant VideoListinheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListinheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListinheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterpath =
        VideoListinheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = sampleVideoUrl[index % sampleVideoUrl.length];
    return Stack(children: [
      FastlaughVideoPlayer(videoUrl: videoUrl, onStateChanged: (bool) {}),
      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //left side
              CircleAvatar(
                  radius: 20,
                  backgroundColor: KBlackColor,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off_rounded,
                      color: kWhiteColor,
                    ),
                  )),

              //right side
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: posterpath == null
                      ? null
                      : NetworkImage("$ImageAppendUrl$posterpath"),
                ),
                kheight10,
                ValueListenableBuilder(
                  valueListenable: LikedVideosNotifier,
                  builder:
                      (BuildContext c, Set<int> newLikedlistId, Widget? _) {
                    final _index = index;
                    if (newLikedlistId.contains(_index)) {
                      return GestureDetector(
                        onTap: () {
                          // BlocProvider.of<FastLaughBloc>(context)
                          //     .add(UnlikeVideo(id: _index));
                          LikedVideosNotifier.value.remove(_index);
                          LikedVideosNotifier.notifyListeners();
                        },
                        child: const VideoActionWidget(
                            color: Colors.red,
                            icon: Icons.favorite,
                            title: 'Liked'),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        // BlocProvider.of<FastLaughBloc>(context)
                        //     .add(LikedVideo(id: _index));
                        LikedVideosNotifier.value.add(_index);
                        LikedVideosNotifier.notifyListeners();
                      },
                      child: const VideoActionWidget(
                          icon: Icons.emoji_emotions, title: 'LOL'),
                    );
                  },
                ),
                const VideoActionWidget(icon: Icons.add, title: 'My List'),
                GestureDetector(
                  onTap: () {
                    final movieName =
                        VideoListinheritedWidget.of(context)?.movieData.title;
                    log(movieName.toString());
                    if (movieName != null) {
                      Share.share(movieName);
                    }
                  },
                  child: const VideoActionWidget(
                      icon: Icons.share_sharp, title: 'Share'),
                ),
                const VideoActionWidget(
                    icon: Icons.play_arrow_sharp, title: 'Play')
              ])
            ],
          ),
        ),
      )
    ]);
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  const VideoActionWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.color = kWhiteColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: kWhiteColor),
          ),
        ],
      ),
    );
  }
}

class FastlaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastlaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FastlaughVideoPlayer> createState() => _FastlaughVideoPlayerState();
}

class _FastlaughVideoPlayerState extends State<FastlaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController))
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
