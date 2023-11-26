import 'package:flutter/material.dart';

import 'package:movieflix/services/api_service.dart';
import 'package:movieflix/widgets/movie_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 120),
            MovieCardWidget(
              movieApiFuture: ApiService.getPopularMovies(),
              title: "Popular Movies",
              imageHeight: 220,
              imageWidth: 320,
              isDisplayTitle: false,
            ),
            MovieCardWidget(
              movieApiFuture: ApiService.getNowPlayingMovies(),
              title: "Now in Cinemas",
              imageHeight: 150,
              imageWidth: 150,
              isDisplayTitle: true,
            ),
            MovieCardWidget(
              movieApiFuture: ApiService.getComingSoonMovies(),
              title: "Coming soon",
              imageHeight: 150,
              imageWidth: 150,
              isDisplayTitle: true,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
