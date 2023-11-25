import 'package:flutter/material.dart';
import 'package:webtoon/widgets/webtoon_widget.dart';

import '../models/webtoon.dart';
import '../services/api_service.dart';

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
              child: CircularProgressIndicator(color: Colors.green),
            );
          }
          return Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: _buildListView(snapshot),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }

  Widget _buildListView(AsyncSnapshot<List<WebtoonTodayModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final webtoon = snapshot.data![index];
        return WebtoonCard(
          id: webtoon.id,
          title: webtoon.title,
          thumb: webtoon.thumb,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 20),
    );
  }
}
