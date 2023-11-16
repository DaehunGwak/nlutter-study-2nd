import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int count = 0;
  bool isShowTitle = true;

  void toggleTitle() {
    setState(() {
      isShowTitle = !isShowTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.red),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFFDF6E3),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: toggleTitle, icon: const Icon(Icons.remove_circle)),
              isShowTitle ? const MyLargeTitle() : const Text("nothing"),
              Text("$count"),
              IconButton(onPressed: onClick, icon: const Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }

  void onClick() {
    setState(() {
      count++;
    });
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {

  /// build 전 실행
  /// 부모의 상태를 초기화해야 할 수도 있으므로 사용
  @override
  void initState() {
    super.initState();
    print("initState");
  }


  /// Widget 이 스크린에서 제거되기 전에 실행
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Text(
      "My Large Title",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
