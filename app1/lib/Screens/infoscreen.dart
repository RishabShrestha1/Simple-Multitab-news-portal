// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late final PodPlayerController controller;
  bool isVisible = true;
  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(
        'https://www.youtube.com/watch?v=Y5Fk9C-2fy8',
      ),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: true,
        isLooping: false,
        videoQualityPriority: [720, 360],
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Post',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_sharp),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
        ],
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          PodVideoPlayer(
            controller: controller,
            alwaysShowProgressBar: false,
            overlayBuilder: (options) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (isVisible == true) {
                      setState(() {
                        isVisible = false;
                      });
                    } else if (isVisible == false) {
                      setState(() {
                        isVisible = true;
                      });
                    }
                  },
                  child: isVisible == true
                      // ignore: avoid_unnecessary_containers
                      ? Container(
                          child: Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.fast_rewind_rounded),
                                        onPressed: () {
                                          controller.videoSeekBackward(
                                              Duration(seconds: 5));
                                        },
                                        color: Colors.white,
                                      ),
                                      //SizedBox(width: 20),
                                      Spacer(),
                                      controller.isVideoPlaying == false
                                          ? IconButton(
                                              icon: Icon(Icons
                                                  .play_circle_outline_rounded),
                                              onPressed: () {
                                                controller.togglePlayPause();
                                              },
                                              color: Colors.white,
                                              iconSize: 50,
                                            )
                                          : IconButton(
                                              icon: Icon(Icons
                                                  .pause_circle_outline_rounded),
                                              onPressed: () {
                                                controller.togglePlayPause();
                                              },
                                              color: Colors.white,
                                              iconSize: 50,
                                            ),
                                      //SizedBox(width: 20),
                                      Spacer(),
                                      IconButton(
                                        icon: Icon(Icons.fast_forward_rounded),
                                        onPressed: () {
                                          controller.videoSeekForward(
                                              Duration(seconds: 5));
                                        },
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 0),
                                child: Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        '${controller.currentVideoPosition.inMinutes}:${controller.currentVideoPosition.inSeconds}/${controller.totalVideoLength.inMinutes}:${controller.totalVideoLength.inSeconds}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      /*SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.691,
                                ),*/
                                      Spacer(),
                                      controller.isFullScreen == false
                                          ? IconButton(
                                              icon: Icon(Icons.fullscreen),
                                              onPressed: () {
                                                controller.enableFullScreen();
                                              },
                                              color: Colors.white,
                                            )
                                          : IconButton(
                                              icon: Icon(Icons.fullscreen_exit),
                                              onPressed: () {
                                                controller
                                                    .disableFullScreen(context);
                                              },
                                              color: Colors.white,
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                              Slider(
                                value: controller.currentVideoPosition.inSeconds
                                    .toDouble(),
                                onChanged: (value) async {
                                  await controller.videoSeekTo(
                                    Duration(
                                      seconds: value.toInt(),
                                    ),
                                  );
                                },
                                min: 0,
                                max: controller.totalVideoLength.inSeconds
                                    .toDouble(),
                                activeColor: Colors.green,
                              )
                            ],
                          ),
                        )
                      : null,
                ),
              );
            },
          ),
          Text('This is the second screen!'),
        ],
      ),
    );
  }
}
