// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app1/Screens/infoscreen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CurrentTabs extends StatefulWidget {
  const CurrentTabs({super.key});

  @override
  State<CurrentTabs> createState() => _CurrentTabsState();
}

class _CurrentTabsState extends State<CurrentTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  bool shimmer = false;
  Future<void> _refresh() {
    setState(() {
      shimmer = true;
    });
    return Future.delayed(Duration(seconds: 1)).then((value) => setState(
          () {
            shimmer = false;
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'Trending',
                ),
                Tab(
                  text: 'Trending',
                ),
                Tab(
                  text: 'Trending Feature',
                ),
                Tab(
                  text: 'Trending',
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              RefreshIndicator(
                onRefresh: _refresh,
                child: GridView.builder(
                  itemCount: 30,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemBuilder: (ctx, index) {
                    return shimmer
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.white,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const InfoScreen()),
                                );
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/image.png', // Replace with your image asset
                                        height: 100,
                                        width: 100,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Item $index',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const InfoScreen()),
                              );
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/image.png', // Replace with your image asset
                                      height: 100,
                                      width: 100,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Item $index',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
