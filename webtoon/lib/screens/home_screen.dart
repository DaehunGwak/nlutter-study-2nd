import 'package:flutter/material.dart';

import '../models/webtoon.dart';
import '../services/api_service.dart';

const _userAgent =
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36";
const _headerMap = {"User-Agent": _userAgent};

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "Today Webtoons",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: ApiService.getTodayToons(),
        builder: (context, snapshot) {
          // snapshot: 주입한 future 정보들
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 4),
            );
          }
          return Column(
            children: [
              const SizedBox(height: 50),
              Expanded(
                child: _buildListView(snapshot),
              ),
              const SizedBox(height: 50),
            ],
          );
        },
      ),
    );
  }

  Widget _buildListView(AsyncSnapshot<List<WebtoonTodayModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final webtoon = snapshot.data![index];
        return Column(
          children: [
            Container(
              width: 150,
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
              child: Image.network(webtoon.thumb, headers: _headerMap),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                webtoon.title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 20),
    );
  }
}
