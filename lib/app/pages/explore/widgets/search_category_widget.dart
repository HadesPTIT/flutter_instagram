import 'package:flutter/material.dart';

class SliverSearchCategoryWidget extends SliverPersistentHeaderDelegate {
  List<String> categories = [
    'IGTV',
    'TV & Movies',
    'Travel',
    'Architecture',
    'Beauty',
    'Art',
    'Decor',
    'Style',
    'Food',
    'DIY',
    'Music',
    'Sports'
  ];

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 46,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                child: index == 0
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SearchCategoryWidget(categories[index]))
                    : SearchCategoryWidget(categories[index]),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 6)),
      ),
    );
  }

  @override
  double get maxExtent => 46;

  @override
  double get minExtent => 46;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class SearchCategoryWidget extends StatelessWidget {
  final String category;

  const SearchCategoryWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey[400],
            width: 1,
          ),
          color: Colors.transparent),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
          child: Text(
            category,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          )),
    );
  }
}
