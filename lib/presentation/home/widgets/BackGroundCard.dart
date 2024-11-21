import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/Downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/strings.dart';
import 'package:netflix/presentation/home/widgets/custom_widget_home.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
       WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    return BlocBuilder<DownloadsBloc, DownloadsState>(
      builder: (context, state) {

         print('State downloads: ${state.downloads}');
    print('Is loading: ${state.isloading}');

        if (state.isloading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }
        if (state.downloads == null || state.downloads!.isEmpty) {
          return const Center(
            child: Text('No Downloads Available',
                style: TextStyle(color: kWhiteColor)),
          );
        }

         final backgroundImage = (state.downloads?.isNotEmpty == true &&
                state.downloads![0].posterPath != null &&
                state.downloads![0].posterPath!.isNotEmpty)
            ? "$ImageAppendUrl${state.downloads![0].posterPath}"
            : null;

        // Fallback if no valid background image URL
        if (backgroundImage == null || backgroundImage.isEmpty) {
          return const Center(
            child: Text(
              'No Image Available',
              style: TextStyle(color: kWhiteColor),
            ),
          );
        }

        return SizedBox(
          child: Stack(
            children: [
              BackGroundImage(backgroundimage: backgroundImage),
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
          ),
        );
      },
    );
  }
}

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({
    super.key,
    required this.backgroundimage,
  });
  final String backgroundimage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(backgroundimage),
            fit: BoxFit.cover,
            onError: (exception, stackTrace) {
              print('Error loading image');
            },
          )),
    );
  }
}
