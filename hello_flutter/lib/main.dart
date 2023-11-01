import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

// starting point
class App extends StatelessWidget {
  // return root widget
  // material(google style) or cupertino(ios app) app 이용할 예정
  // scaffold 를 먼저 깔아서 구조를 가져줘야 함
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('hello-flutter'),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
