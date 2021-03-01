import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/models/story_model.dart';
import 'package:flutter_new_instagram/app/pages/story/widget/story_progress_view.dart';
import 'package:flutter_new_instagram/app/pages/story/widget/story_user_info.dart';
import 'package:video_player/video_player.dart';

class StoryScreen extends StatefulWidget {
  final List<Story> stories;

  const StoryScreen({@required this.stories});

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  VideoPlayerController _videoController;
  AnimationController _animController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _animController = AnimationController(vsync: this);

    final Story firstStory = widget.stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController.stop();
        _animController.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories[_currentIndex]);
          } else {
            Navigator.of(context).pop();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final story = widget.stories[_currentIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: GestureDetector(
          onTapDown: (details) => _onTapDown(details, story),
          child: Stack(
            children: [
              PageView.builder(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.stories.length,
                  itemBuilder: (context, index) {
                    final story = widget.stories[index];
                    switch (story.media) {
                      case MediaType.image:
                        return CachedNetworkImage(
                            imageUrl: story.url, fit: BoxFit.cover);
                      case MediaType.video:
                        if (_videoController != null &&
                            _videoController.value.initialized) {
                          return FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: _videoController.value.size.width,
                              height: _videoController.value.size.height,
                              child: VideoPlayer(_videoController),
                            ),
                          );
                        }
                    }
                    return const SizedBox.shrink();
                  }),
              Positioned(
                top: 10.0,
                left: 10.0,
                right: 10.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: widget.stories
                          .asMap()
                          .map((index, element) {
                            return MapEntry(
                              index,
                              StoryProgressView(
                                animationController: _animController,
                                position: index,
                                currentIndex: _currentIndex,
                              ),
                            );
                          })
                          .values
                          .toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 1.5,
                        vertical: 10.0,
                      ),
                      child: StoryUserInfo(user: story.user),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loadStory({Story story, bool animateToPage = true}) {
    _animController.stop();
    _animController.reset();
    switch (story.media) {
      case MediaType.image:
        _animController.duration = story.duration;
        _animController.forward();
        break;
      case MediaType.video:
        _videoController = null;
        _videoController?.dispose();
        _videoController = VideoPlayerController.network(story.url)
          ..initialize().then((value) {
            setState(() {});
            if (_videoController.value.initialized) {
              _animController.duration = _videoController.value.duration;
              _videoController.play();
              _animController.forward();
            }
          });
        break;
    }
    if (animateToPage) {
      _pageController.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: 1), curve: Curves.easeOut);
    }
  }

  ///
  /// Divide into 3 parts
  /// Left : load previous story
  /// Right : load next story
  /// Center : play/pause
  ///
  void _onTapDown(TapDownDetails details, Story story) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tapDx = details.globalPosition.dx;
    if (tapDx < screenWidth / 3) {
      setState(() {
        _currentIndex = (_currentIndex - 1 >= 0) ? _currentIndex - 1 : 0;
        _loadStory(story: widget.stories[_currentIndex]);
      });
    } else if (tapDx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < widget.stories.length) {
          _currentIndex += 1;
          _loadStory(story: widget.stories[_currentIndex]);
        } else {
          Navigator.of(context).pop();
        }
      });
    } else {
      if (story.media == MediaType.video) {
        if (_videoController.value.isPlaying) {
          _videoController.pause();
          _animController.stop();
        } else {
          _videoController.play();
          _animController.forward();
        }
      }
    }
  }
}
