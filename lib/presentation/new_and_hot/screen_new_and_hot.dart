import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widgets.dart';
import 'package:netflix/presentation/new_and_hot/widgets/eveyone_watching_widget.dart';

import '../../core/colors/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: kWhiteColor),
            ),
            bottom: TabBar(
                dividerColor: Colors.transparent,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: -20),
                isScrollable: true,
                labelColor: KBlackColor,
                labelStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(25)),
                tabs: const [
                  Tab(
                    text: "🍿 Coming Soon",
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  ),
               
                ]),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kwidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              kwidth,
            ],
          ),
        ),
        body: const TabBarView (
          children: [
          ComingSoonList(),
          EveryoneIseWatching()
        ]),
      ),
    );
  }

  // Widget _buildComingSoon() {
  //   return ListView.separated(
  //     itemCount: 10,
  //     itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
  //     separatorBuilder: (BuildContext context, index) => kheight10,
  //   );
  // }

  // Widget _buildEveryoneWatching() {
  //   return ListView.separated(
  //       itemBuilder: (BuildContext context, index) =>
  //           const EveryOneWatchingWidget(),
  //       separatorBuilder: (BuildContext context, index) => kheight10,
  //       itemCount: 10
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isloading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.iserror) {
          return const Text('Error while loading the Data');
        } else if (state.comingSoonList.isEmpty) {
          return const Text('Error while fetching the Data');
        } else {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 20),
            itemCount: state.comingSoonList.length,
            itemBuilder: (BuildContext context, index) {
              final movie = state.comingSoonList[index];
              print(movie.releaseDate);
              final _date = DateTime.parse(movie.releaseDate!);
              final formatedDate = DateFormat.yMMMMd('en_US').format(_date);
              print(formatedDate);
              return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase(),
                  day: movie.releaseDate!.split('-')[1],
                  posterPath: '$ImageAppendUrl${movie.posterPath}',
                  movietitle: movie.originalTitle ?? 'No Title',
                  description: movie.overview ?? 'No Description');
            },
            separatorBuilder: (BuildContext context, index) => kheight10,
          );
        }
      },
    );
  }
}

class EveryoneIseWatching extends StatelessWidget {
  const EveryoneIseWatching({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isloading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.iserror) {
          return const  Center(child:  Text('Error while loading the Data'));
        } else if (state.everyoneWatchingList.isEmpty) {
          return const Center(child: Text('Error while fetching the Data'));
        } else {
          return ListView.separated(
            padding: const EdgeInsets.only(bottom: 10,left: 20,right: 20),
            itemCount: state.everyoneWatchingList.length,
            itemBuilder: (BuildContext context, index) {
            
              final tv = state.everyoneWatchingList[index];
               final imageUrl = tv.posterPath != null ? '$ImageAppendUrl${tv.posterPath}' : '';
              return EveryOneWatchingWidget(
                  posterPath:imageUrl,
                  movieName: tv.originalName?? 'No Title Provided',
                  description: tv.overview?? 'No Description');
            },
            separatorBuilder: (BuildContext context, index) => kheight10,
          );
        }
      },
    );
  }
}
