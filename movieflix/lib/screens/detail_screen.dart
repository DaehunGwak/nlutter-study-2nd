import 'package:flutter/material.dart';
import 'package:movieflix/services/api_service.dart';
import 'package:movieflix/utils/tag_builder.dart';
import 'package:movieflix/widgets/movie_datail_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.middleTag,
  });

  final int id;
  final String title;
  final String imageUrl;
  final String middleTag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: TagBuilder.buildImageTag(middleTag, id),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: NetworkImage(imageUrl),
        )),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          appBar: AppBar(
            title: Text(
              'Back to list',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.background),
            ),
            centerTitle: false,
            iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.background,
            ),
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
          ),
          body: FutureBuilder(
            future: ApiService.getDetailMovie(id),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return DetailLoadingWidget(title: title);
              }
              return DetailMetaWidget(movie: snapshot.data!);
            },
          ),
        ),
      ),
    );
  }
}
