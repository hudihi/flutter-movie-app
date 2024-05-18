import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'home.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  final apikey = dotenv.env['API_KEY'];
  debugPrint(apikey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie browser',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: const Color(0xFF0000CD),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(
        title: 'Movies',
      ),
    );
  }
}
