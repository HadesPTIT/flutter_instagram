import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/dummy/dummy.dart';
import 'package:flutter_new_instagram/app/pages/home/widget/home_story_item_widget.dart';

class ProfileHighlightsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemWidth = (MediaQuery.of(context).size.width - 12.0 * 5) / 5;

    return Container(
      color: Colors.white,
      height: itemWidth + 40,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 8.0),
                  child: HomeStoryItemWidget(
                      onItemPress: () => {},
                      story: stories[index%6],
                      size: itemWidth)));
        },
        separatorBuilder: (context, index) => SizedBox(width: 1.0),
      ),
    );
  }
}
