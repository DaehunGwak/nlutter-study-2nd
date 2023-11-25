import 'package:flutter/material.dart';

import '../constants/headers.dart' as headers;

class DetailScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
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
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
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
              child: Image.network(thumb, headers: headers.headerMap),
            ),
          )
        ],
      ),
    );
  }
}
