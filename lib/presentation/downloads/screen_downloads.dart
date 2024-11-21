import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/Downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/core/colors/strings.dart';
import 'package:netflix/presentation/widgets/app_bar_widgets.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _smartDownloads(),
    const SizedBox(
      height: 20,
    ),
    Section2(),
    const section3()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidgets(
              title: 'Downloads',
            )),
        body: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemBuilder: (ctx, index) => _widgetList[index],
          itemCount: _widgetList.length,
        ));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });

    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          textAlign: TextAlign.center,
          'Introducing Downloads for You',
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w800, fontSize: 23),
        ),
        kheight10,
        const Text(
          textAlign: TextAlign.center,
          "we'll download a personalised selection of \n movies and shows for you,so there's \n is always something to watch on \n your device",
          style: TextStyle(color: Colors.grey, fontSize: 17),
        ),
        kheight10,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            if (state.downloads == null || state.downloads!.isEmpty) {
              return const Center(
                child: Text('No Downloads Available',
                    style: TextStyle(color: kWhiteColor)),
              );
            }
            return SizedBox(
              width: size.width,
              height: size.width - 50,
              child: state.isloading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          radius: size.width * 0.40,
                        ),
                        DownloadImageWidget(
                          imageList:
                              "$ImageAppendUrl${state.downloads![0].posterPath}",
                          margin: const EdgeInsets.only(left: 160, bottom: 40),
                          angle: 23,
                          size: Size(size.width * 0.4, size.width * 0.53),
                        ),
                        DownloadImageWidget(
                          imageList:
                              "$ImageAppendUrl${state.downloads![1].posterPath}",
                          margin: const EdgeInsets.only(right: 160, bottom: 40),
                          angle: -23,
                          size: Size(size.width * 0.4, size.width * 0.53),
                        ),
                        DownloadImageWidget(
                          imageList:
                              "$ImageAppendUrl${state.downloads![2].posterPath}",
                          margin: const EdgeInsets.only(top: 10),
                          radius: 18,
                          size: Size(size.width * 0.47, size.width * 0.63),
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class section3 extends StatelessWidget {
  const section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: kButtonColorBlue,
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Set Up',
                  style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: KButtonColorWhite,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'See What You Can Download',
                style: TextStyle(
                    color: KBlackColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 16),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kwidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kwidth,
        Text(
          'Smart Downloads',
          style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  });

  final EdgeInsets margin;
  final double angle;
  final String imageList;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageList))),
        ),
      ),
    );
  }
}
