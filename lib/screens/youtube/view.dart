import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePage extends StatefulWidget {
  const YoutubePage({Key? key}) : super(key: key);

  @override
  State<YoutubePage> createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  // late YoutubePlayerController _controller;
  // String videoId = '-jA14r2ujQ7s';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: 'avz06PDqDbM',
              flags: const YoutubePlayerFlags(
                autoPlay: true,
                mute: false,
                loop: true,
              ),
            ),
            showVideoProgressIndicator: true,
            progressColors: const ProgressBarColors(
              playedColor: Colors.red,
              handleColor: Colors.white,
            ),
            // onReady: () {
            //   _controller.addListener(() {});
            // },
          ),
          builder: (context, player) => player,
        ),
      ),
    );
  }
}
