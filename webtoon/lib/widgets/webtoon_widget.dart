import 'package:flutter/material.dart';
import 'package:webtoon/screens/detail_screen.dart';

import '../constants/headers.dart' as headers;

class WebtoonCard extends StatelessWidget {
  const WebtoonCard({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  final String id;
  final String title;
  final String thumb;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            // fullscreenDialog: true, // 아래에서 위로 다이얼로그 형태 활성화 유무 (이전 스크린은 X 로 갈 수 있음)
            builder: (context) => DetailScreen(
              id: id,
              title: title,
              thumb: thumb,
            ),
          ),
        );
      },
      child: Column(
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
            child: Image.network(thumb, headers: headers.headerMap),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
