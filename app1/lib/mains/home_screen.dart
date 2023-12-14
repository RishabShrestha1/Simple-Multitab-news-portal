import 'package:flutter/material.dart';
import '../../page_content.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 183, 58)),
        useMaterial3: true,
      ),
      home: const PageContent(),
    );
  }
}
