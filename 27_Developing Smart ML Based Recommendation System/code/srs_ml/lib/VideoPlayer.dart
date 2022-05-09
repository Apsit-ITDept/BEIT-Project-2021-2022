// ignore_for_file: file_names, prefer_const_constructors, unused_import



import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class VideoPlayer extends StatefulWidget {
  const VideoPlayer({ Key? key, required this.title }) : super(key: key);
  
  final String title;
  

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;

  void runYoutubePlayer(){
    _controller = YoutubePlayerController(
      initialVideoId: 'BE9ATY2Ygas',
      flags:YoutubePlayerFlags(
        enableCaption:false,
        isLive: false,
        autoPlay:false,
      )
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget>[
            YoutubePlayer(
              controller: _controller ,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.pinkAccent,
              ),
          ],
        ),
      ),
      
    );
  }
}