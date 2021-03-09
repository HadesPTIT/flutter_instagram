import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsFeedSkeletonListTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            _buildStoriesSkeleton(context),
            SizedBox(height: 10),
            _buildPostsSkeleton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPostsSkeleton(BuildContext context) {
    return Container(
      height: 1000,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _skeletonView(CircleAvatar(radius: 16)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _skeletonView(ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                                width: 200, height: 10, color: Colors.white))),
                        SizedBox(height: 5),
                        _skeletonView(ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                                width: 100, height: 8, color: Colors.white)))
                      ],
                    )
                  ],
                ),
                _skeletonView(Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.white,
                ))
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 20.0),
      ),
    );
  }

  Widget _skeletonView(Widget content) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: content);
  }

  Widget _buildStoriesSkeleton(BuildContext context) {
    final itemWidth = (MediaQuery.of(context).size.width - 12.0 * 5) / 5.5;
    return Container(
      height: itemWidth + 20,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Container(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: CircleAvatar(
                      radius: 31,
                    ))),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 1.0),
      ),
    );
  }
}
