import 'package:flutter/material.dart';
import 'package:picsum_api_example/listdata.dart';
import 'package:picsum_api_example/picsumApi.dart';

void main() {
  runApp(
    MaterialApp(
      home: ListData(),
    ),
  );
}

class PicsumSplash extends StatefulWidget {
  const PicsumSplash({Key? key}) : super(key: key);

  @override
  _PicsumSplashState createState() => _PicsumSplashState();
}

class _PicsumSplashState extends State<PicsumSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
