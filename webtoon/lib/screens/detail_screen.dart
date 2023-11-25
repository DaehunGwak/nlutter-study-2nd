import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webtoon/services/api_service.dart';

import '../constants/headers.dart' as headers;
import '../models/webtoon.dart';
import '../widgets/episode_widget.dart';

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
  late Future<List<WebtoonEpisodeModel>> episodeFuture;

  @override
  void initState() {
    super.initState();
    detailFuture = ApiService.getToonById(widget.id);
    episodeFuture = ApiService.getLatestEpisodesById(widget.id);
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
          actions: [
            WebtoonFavoriteButton(toonId: widget.id)
          ]),
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
              future: episodeFuture,
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
                        EpisodeWidget(titleId: widget.id, episode: episode),
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

class WebtoonFavoriteButton extends StatefulWidget {
  WebtoonFavoriteButton({
    super.key,
    required this.toonId,
  });

  final String toonId;

  @override
  State<WebtoonFavoriteButton> createState() => _WebtoonFavoriteButtonState();
}

class _WebtoonFavoriteButtonState extends State<WebtoonFavoriteButton> {
  static const String _likedToonsKey = 'likedToons';

  late SharedPreferences pref; // for local file
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  Future initPrefs() async {
    pref = await SharedPreferences.getInstance();

    final likedToons = pref.getStringList(_likedToonsKey);
    print(likedToons);

    if (likedToons == null) {
      await pref.setStringList(_likedToonsKey, []);
      return;
    }

    setState(() {
      isLiked = likedToons.contains(widget.toonId);
    });
  }

  void onFavoriteButtonTap() async {
    final likedToonIds = pref.getStringList(_likedToonsKey)!;
    print(likedToonIds);

    if (likedToonIds.contains(widget.toonId)) {
      likedToonIds.remove(widget.toonId);
      await pref.setStringList(_likedToonsKey, likedToonIds);
      setState(() {
        isLiked = false;
      });
      return;
    }

    likedToonIds.add(widget.toonId);
    await pref.setStringList(_likedToonsKey, likedToonIds);
    setState(() {
      isLiked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onFavoriteButtonTap,
      icon: Icon(isLiked ? Icons.favorite : Icons.favorite_outline),
    );
  }
}
