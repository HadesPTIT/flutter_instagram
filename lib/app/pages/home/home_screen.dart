import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/dummy/dummy.dart';
import 'package:flutter_new_instagram/app/pages/home/widget/feed_widget.dart';
import 'package:flutter_new_instagram/app/pages/home/widget/home_appbar_widget.dart';
import 'package:flutter_new_instagram/app/pages/home/widget/home_story_item_widget.dart';
import 'package:flutter_new_instagram/app/pages/home/widget/self_story_item_widget.dart';
import 'package:flutter_new_instagram/app/pages/story/story_screen.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: Container(
            color: Colors.white,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return index == 0 ? _buildInstaStories() : FeedWidget();
              },
            ),
          ),
        ),
      ),
    );
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
}
