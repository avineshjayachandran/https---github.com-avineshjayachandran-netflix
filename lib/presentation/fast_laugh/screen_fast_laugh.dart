import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fastlaugh/fast_laugh_bloc.dart';

import 'package:netflix/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(child: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isloading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.iserror) {
            return const Center(child: Text("Error while loading the Data"));
          } else if (state.videoList.isEmpty) {
            return const Center(
              child: Text("VideoList is Empty"),
            );
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(state.videoList.length, (index) {
                return VideoListinheritedWidget(
                    childWidget:
                        VideoListItem(key: Key(index.toString()), index: index),
                    movieData: state.videoList[index]);
              }),
            );
          }
        },
      )),
    );
  }
}
