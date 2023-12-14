// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../mytabs.dart';

class PageContent extends StatefulWidget {
  const PageContent({super.key});

  @override
  State<PageContent> createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Video',
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(Icons.arrow_back_ios_new),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
          ],
          backgroundColor: Colors.green,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: CurrentTabs(),
      ),
    );
  }
}
