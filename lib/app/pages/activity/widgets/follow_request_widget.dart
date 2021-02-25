import 'package:flutter/material.dart';

class SliverFollowRequestWidget extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Text(
                  'Follow Requests',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.5),
                ),
              ),
              Spacer(),
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text('1,234'),
              )
            ],
          ),
          Container(height: 0.3, color: Colors.grey[400])
        ],
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
