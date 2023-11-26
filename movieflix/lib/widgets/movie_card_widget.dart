import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_meta.dart';
import 'package:movieflix/screens/detail_screen.dart';
import 'package:movieflix/utils/tag_builder.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    super.key,
    required this.movieApiFuture,
    required this.title,
    required this.imageHeight,
    required this.imageWidth,
    this.isDisplayTitle = true,
  });

  final Future<List<SimpleMovie>> movieApiFuture;
  final String title;
  final double imageHeight;
  final double imageWidth;
  final bool isDisplayTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: isDisplayTitle ? (imageHeight + 80) : (imageHeight + 10),
          child: FutureBuilder(
            future: movieApiFuture,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return _EmptyCardListWidget(
                  imageWidth: imageWidth,
                  imageHeight: imageHeight,
                  isDisplayTitle: isDisplayTitle,
                );
              }
              return _CardListWidget(
                imageWidth: imageWidth,
                imageHeight: imageHeight,
                isDisplayTitle: isDisplayTitle,
                movies: snapshot.data!,
                middleTag: title,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CardListWidget extends StatelessWidget {
  const _CardListWidget({
    required this.imageWidth,
    required this.imageHeight,
    required this.isDisplayTitle,
    required this.movies,
    required this.middleTag,
  });

  final double imageWidth;
  final double imageHeight;
  final bool isDisplayTitle;
  final List<SimpleMovie> movies;
  final String middleTag;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {
        // cache image
        precacheImage(Image.network(movies[index].imageBigUrl!).image, context);

        // widget
        return GestureDetector(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  id: movies[index].id,
                  title: movies[index].title,
                  imageUrl: movies[index].imageBigUrl!,
                  middleTag: middleTag,
                ),
              ),
            )
          },
          child: Container(
            width: imageWidth,
            decoration: const BoxDecoration(color: Colors.transparent),
            clipBehavior: Clip.hardEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: TagBuilder.buildImageTag(middleTag, movies[index].id),
                  child: Container(
                    width: imageWidth,
                    height: imageHeight,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.primary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.network(
                      movies[index].imageUrl!,
                      height: imageHeight,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (isDisplayTitle)
                  Text(
                    movies[index].title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 20),
    );
  }
}

class _EmptyCardListWidget extends StatelessWidget {
  const _EmptyCardListWidget({
    required this.imageWidth,
    required this.imageHeight,
    required this.isDisplayTitle,
  });

  final double imageWidth;
  final double imageHeight;
  final bool isDisplayTitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20),
          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: imageWidth,
                    height: imageHeight,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (isDisplayTitle)
                    Container(
                      width: imageWidth - 10,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.3),
                      ),
                    )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
