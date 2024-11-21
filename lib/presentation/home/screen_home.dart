import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';

import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/core/colors/strings.dart';
import 'package:netflix/presentation/home/widgets/BackGroundCard.dart';

import 'widgets/maintitlecard.dart';
import 'widgets/number_card_widget.dart';

ValueNotifier<bool> scrollNotifiier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifiier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (Notification) {
                  final ScrollDirection direction = Notification.direction;
                  print(direction);
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifiier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifiier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.iserror) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        } else if (state.iserror) {
                          return const Center(
                              child: Text('Error while Fetching Data'));
                        }
                        final releasedPastYear =
                            state.pastYearMovieList.map((m) {
                          return "$ImageAppendUrl${m.posterPath}";
                        }).toList();
                        releasedPastYear.shuffle();

                        final trendingNow = state.trenidngNowMovieList.map((m) {
                          return "$ImageAppendUrl${m.posterPath}";
                        }).toList();
                        trendingNow.shuffle();

                        final tenseDrama = state.tenseDramaMovieList.map((m) {
                          return "$ImageAppendUrl${m.posterPath}";
                        }).toList();
                        tenseDrama.shuffle();

                        final SouthIndian = state.southIndianMovieList.map((m) {
                          return "$ImageAppendUrl${m.posterPath}";
                        }).toList();
                        SouthIndian.shuffle();

                        return ListView(
                          children: [
                            const BackGroundCard(),
                            MainTitleCard(
                                title: 'Released This Year',
                                posterList: releasedPastYear),
                            MainTitleCard(
                              title: 'Trending Now',
                              posterList: trendingNow,
                            ),
                            numbercardwidget(
                              title: 'Top 10 Shows',
                            ),
                            MainTitleCard(
                              title: 'Popular Movies',
                              posterList: tenseDrama,
                            ),
                            MainTitleCard(
                              title: 'Most Viewed',
                              posterList: SouthIndian,
                            ),
                            kheight10
                          ],
                        );
                      },
                    ),
                    scrollNotifiier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(microseconds: 1000),
                            height: 90,
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.3),
                            child: Column(
                              children: [
                                kheight10,
                                Row(
                                  children: [
                                    kwidth,
                                    Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png',
                                      width: 40,
                                      height: 40,
                                    ),
                                    const Spacer(),
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
                                kheight10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      ' TV Shows',
                                      style: kHomeTitleText,
                                    ),
                                    Text(
                                      "Movies",
                                      style: kHomeTitleText,
                                    ),
                                    Text(
                                      "Categories",
                                      style: kHomeTitleText,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : kheight10,
                  ],
                ),
              );
            }));
  }
}
