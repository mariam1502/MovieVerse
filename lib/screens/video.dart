import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

enum DataSourceType { asset, network, contentUri }

class VideoPlayerView extends StatefulWidget {
  final String url;
  final DataSourceType dataSourceType;

  const VideoPlayerView(
      {Key? key, required this.url, required this.dataSourceType})
      : super(key: key);

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(widget.url));
        break;
      case DataSourceType.contentUri:
        _videoPlayerController =
            VideoPlayerController.contentUri(Uri.parse(widget.url));
        break;
    }
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      showControls: true,
      aspectRatio: 16 / 9,
      allowFullScreen: true,
      fullScreenByDefault: false,
      allowMuting: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _videoPlayerController.value.aspectRatio,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(35, 0, 25, 20),
            child: Chewie(
              controller: _chewieController,
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(65, 0, 65, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.replay_10,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _chewieController.seekTo(Duration(
                          seconds: _chewieController.videoPlayerController.value
                                  .position.inSeconds -
                              10));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.fast_rewind_rounded, color: Colors.white),
                    onPressed: () {
                      _chewieController.seekTo(Duration(
                          minutes: _chewieController.videoPlayerController.value
                                  .position.inMinutes -
                              1));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.fast_forward_rounded, color: Colors.white),
                    onPressed: () {
                      _chewieController.seekTo(Duration(
                          minutes: _chewieController.videoPlayerController.value
                                  .position.inMinutes +
                              1));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.forward_10, color: Colors.white),
                    onPressed: () {
                      _chewieController.seekTo(Duration(
                          seconds: _chewieController.videoPlayerController.value
                                  .position.inSeconds +
                              10));
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
