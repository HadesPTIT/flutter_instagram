import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_instagram/app/blocs/feed/feed_bloc.dart';
import 'package:flutter_new_instagram/app/dummy/dummy.dart';
import 'package:flutter_new_instagram/app/pages/home/widget/feed_widget.dart';
import 'package:flutter_new_instagram/app/pages/home/widget/home_appbar_widget.dart';
import 'package:flutter_new_instagram/app/pages/home/widget/home_story_item_widget.dart';
import 'package:flutter_new_instagram/app/pages/home/widget/newsfeed_skeleton_list_tile_widget.dart';
import 'package:flutter_new_instagram/app/pages/home/widget/self_story_item_widget.dart';
import 'package:flutter_new_instagram/app/pages/story/story_screen.dart';
import 'package:flutter_new_instagram/app/repositories/auth/auth_repository.dart';
import 'package:flutter_new_instagram/app/repositories/post/post_repository.dart';
import 'package:flutter_new_instagram/app/widgets/state_view_widget.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'dart:developer' as developer;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  final FeedCubit _cubit = FeedCubit(
      authRepository: AuthRepositoryImpl(),
      postRepository: PostRepositoryImpl());

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _onScroll();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _cubit..close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<FeedCubit, NewsFeedState>(
        cubit: _cubit..run(),
        listener: (context, state) {
          if (state.status == NewsFeedStatus.error) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).primaryColor,
                duration: const Duration(seconds: 1),
                content: const Text('Something wrong...'),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: HomeAppBarWidget(),
            body: LiquidPullToRefresh(
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 1));
                },
                color: Colors.white,
                height: 60,
                borderWidth: 2,
                backgroundColor: Colors.orange,
                springAnimationDurationInMilliseconds: 200,
                showChildOpacityTransition: false,
                child: _buildNewFeeds(state)),
          );
        },
      ),
    );
  }

  Widget _buildNewFeeds(NewsFeedState state) {
    switch (state.status) {
      case NewsFeedStatus.loading:
        return NewsFeedSkeletonListTileWidget();
      case NewsFeedStatus.error:
        return StateView(
          imagePath: Assets.images.imgStateView,
          title: 'Oops...',
          message: 'Something went wrong. Please try again later !!!',
          cta: 'Retry',
          onCtaClick: () {
            _cubit.run();
          },
        );
      case NewsFeedStatus.loaded:
      case NewsFeedStatus.end:
        return Container(
          color: Colors.white,
          child: ListView.builder(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            itemCount: state.posts.length + 1,
            itemBuilder: (context, index) {
              if (!state.hasReachMax && index == state.posts.length) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CircularProgressIndicator(),
                );
              }
              return index == 0
                  ? _buildInstaStories()
                  : FeedWidget(
                      post: state.posts[index - 1],
                      isLiked: true,
                      onLike: () {},
                    );
            },
          ),
        );
      default:
        return SizedBox();
    }
  }

  Widget _buildInstaStories() {
    // Max item shown in list = 5
    final itemWidth = (MediaQuery.of(context).size.width - 12.0 * 5) / 5.5;

    return Column(
      children: [
        Container(
          height: itemWidth + 40,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: stories.length + 1,
            itemBuilder: (context, index) {
              return Container(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 8.0),
                      child: index == 0
                          ? SelfStoryItemWidget(size: itemWidth)
                          : HomeStoryItemWidget(
                              onItemPress: () =>
                                  Get.to(StoryScreen(stories: stories)),
                              size: itemWidth,
                              story: stories[index - 1])));
            },
            separatorBuilder: (context, index) => SizedBox(width: 1.0),
          ),
        ),
        const Divider(
          color: Colors.black12,
          height: 1,
          thickness: 0.5,
        )
      ],
    );
  }

  void _onScroll() {
    var isScrollEdgeBottom = _scrollController.position.atEdge &&
        _scrollController.position.pixels != 0;
    if (isScrollEdgeBottom && _cubit.state.status != NewsFeedStatus.end) {
      developer.log(">>>>> LOAD MORE");
      _cubit.run(loadMore: true);
    }
  }
}
