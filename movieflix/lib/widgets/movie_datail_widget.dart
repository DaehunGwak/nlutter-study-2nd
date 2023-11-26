import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_meta.dart';

class DetailLoadingWidget extends StatelessWidget {
  const DetailLoadingWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(),
        ),
        Expanded(
          flex: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.background,
                      ),
                ),
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DetailMetaWidget extends StatelessWidget {
  const DetailMetaWidget({
    super.key,
    required this.movie,
  });

  final DetailMovie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(),
        ),
        Expanded(
          flex: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            constraints: const BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.background,
                      ),
                ),
                Row(
                  children: [
                    for (double i = 0; i < 10; i += 2)
                      StarFilledIcon(
                        ratio: (movie.voteAverage - i) / 2.0,
                      ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  '${movie.formattedRuntime} | ${movie.formattedGenres}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.background,
                      ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Storyline',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.background,
                      ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      movie.overview,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 5,
                child: SizedBox(
                  height: 60,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFF8D849),
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                    child: Text('Buy Ticket'),
                  ),
                ),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ),
      ],
    );
  }
}

class StarFilledIcon extends StatelessWidget {
  const StarFilledIcon({
    super.key,
    required this.ratio,
  });

  final double ratio;

  @override
  Widget build(BuildContext context) {
    final realRatio = _realRatio();
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (rect) {
        return LinearGradient(
          stops: [0, realRatio, realRatio],
          colors: [Colors.yellow, Colors.yellow, Colors.yellow.withOpacity(0)],
        ).createShader(rect);
      },
      child: const Icon(Icons.star, color: Colors.white),
    );
  }

  double _realRatio() => min(1.0, ratio);
}
