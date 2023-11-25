import 'package:flutter/material.dart';
import 'package:webtoon/services/api_service.dart';

import '../constants/headers.dart' as headers;
import '../models/webtoon.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  final String id;
  final String title;
  final String thumb;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // stateful widget 으로 바꾼 이유
  // future api method 에 paramter 가 추가되어서...
  late Future<WebtoonDetailModel> detailFuture;
  late Future<List<WebtoonEpisodeModel>> episodesFutre;

  @override
  void initState() {
    super.initState();
    detailFuture = ApiService.getToonById(widget.id);
    episodesFutre = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(
              child: Hero(
                tag: widget.id,
                child: Container(
                  width: 250,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 7,
                        offset: Offset(5, 5),
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  child:
                      Image.network(widget.thumb, headers: headers.headerMap),
                ),
              ),
            ),
            const SizedBox(height: 25),
            FutureBuilder(
              future: detailFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.green),
                  );
                }
                final detail = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Text(
                        '${detail.genre} / ${detail.age}',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        detail.about,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
            FutureBuilder(
              future: episodesFutre,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.green),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      for (var episode in snapshot.data!)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.only(left: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  episode.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.chevron_right,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(height: 40),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
