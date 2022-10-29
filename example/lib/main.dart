import 'package:example/routes/routes.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const RandomXExampleApp());
}

class RandomXExampleApp extends StatelessWidget {
  const RandomXExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      routes: {
        Routes.homeRoute: (context) => const HomePage(),
      },
    );
  }
}
