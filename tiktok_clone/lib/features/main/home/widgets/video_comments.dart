import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

import '../../../../constants/gaps.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.7,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false, // NEW: `<` 버튼 삭제
          title: const Text("22796 comments"),
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: const FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size10,
                horizontal: Sizes.size16,
              ),
              separatorBuilder: (context, index) => Gaps.v20,
              itemCount: 200,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      child: Text('N'),
                    ),
                    Gaps.h10,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Daehun Gwak',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: Sizes.size14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.v3,
                          const Text(
                            "That's not it l've seen the same thing but also in a cave",
                          ),
                        ],
                      ),
                    ),
                    Gaps.h10,
                    Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size20,
                          color: Colors.grey.shade500,
                        ),
                        Gaps.v2,
                        Text(
                          '52.2K',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: Sizes.size14,
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
            Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              // NEW: 0 으로 하니 같이 끌어올려지지 않음
              // https://github.com/flutter/flutter/issues/18564#issuecomment-419804357
              width: size.width,
              child: BottomAppBar(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                    vertical: Sizes.size10,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: Text(
                          'N',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: TextField(
                          cursorColor: Theme.of(context).colorScheme.primary,
                          decoration: InputDecoration(
                            hintText: 'Write a comment...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Sizes.size12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size12,
                              vertical: Sizes.size10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
