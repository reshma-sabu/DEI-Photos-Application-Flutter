import 'package:atlantis_di_photos_app/model/offers/offersM.dart';
import 'package:atlantis_di_photos_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PreviewVideoScreen extends StatefulWidget {
  final OfferDetailM dataFromOfferDetail;
  final int index;
  const PreviewVideoScreen(
      {super.key, required this.dataFromOfferDetail, required this.index});

  @override
  State<PreviewVideoScreen> createState() => _PreviewVideoScreenState();
}

class _PreviewVideoScreenState extends State<PreviewVideoScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller =
        VideoPlayerController.asset(widget.dataFromOfferDetail.videoUrl ?? '');
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _fastForward() {
    _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds + 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ConstColors.DIGreen,
              )),
        ),
        body:
            //to show the spinner until controller finishes initializing
            FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapShot) {
                  print(snapShot);
                  if (snapShot.connectionState == ConnectionState.done) {
                    return Column(
                      children: [
                        AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                        VideoProgressIndicator(
                          _controller, 
                          allowScrubbing: true)
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: ConstColors.DIGreen,
              heroTag: 'playButton',
              onPressed: () {
                setState(() {
                   _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
                });
              },
              child:  Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white),
            ),
            const SizedBox(width: 8),
            FloatingActionButton(
              backgroundColor: ConstColors.DIGreen,
              heroTag: 'seekButton',
              onPressed: () {
                setState(() {
                  _fastForward();
                });
              },
              child: const Icon(Icons.fast_forward, color: Colors.white,),
            ),
          ],
        ));
  }
}
