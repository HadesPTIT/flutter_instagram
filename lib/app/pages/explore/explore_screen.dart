import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/pages/explore/widgets/explore_item_widget.dart';
import 'package:flutter_new_instagram/app/pages/explore/widgets/search_category_widget.dart';
import 'package:flutter_new_instagram/app/pages/explore/widgets/search_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: false,
              // Allows the user to reveal the app bar if they
              // begin scrolling back up the list of items.
              floating: true,
              delegate: SliverSearchDelegateWidget(),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: SliverSearchCategoryWidget(),
            ),
            SliverStaggeredGrid.countBuilder(
              itemCount: 30,
              crossAxisCount: 3,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              itemBuilder: (BuildContext context, int index) {
                return _exploreList()[index % 10];
              },
              staggeredTileBuilder: (int index) {
                return StaggeredTile.count(
                    index % 5 == 0 ? 2 : 1, index % 5 == 0 ? 2 : 1);
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _exploreList() {
    return [
      ExploreItemWidget(
          'https://wallpapercave.com/wp/wp3156022.jpg', ExploreType.VIDEO),
      ExploreItemWidget('https://wallpapercave.com/uwp/uwp9990.png',
          ExploreType.SINGLE_IMAGE),
      ExploreItemWidget('https://wallpapercave.com/wp/wp3856709.jpg',
          ExploreType.MULTI_IMAGE),
      ExploreItemWidget('https://wallpapercave.com/wp/wp7804681.jpg',
          ExploreType.SINGLE_IMAGE),
      ExploreItemWidget('https://wallpapercave.com/wp/wp3856716.png',
          ExploreType.MULTI_IMAGE),
      ExploreItemWidget(
          'https://wallpapercave.com/wp/wp5376668.png', ExploreType.VIDEO),
      ExploreItemWidget('https://wallpapercave.com/wp/wp7804706.jpg',
          ExploreType.MULTI_IMAGE),
      ExploreItemWidget('https://wallpapercave.com/wp/wp2471312.jpg',
          ExploreType.SINGLE_IMAGE),
      ExploreItemWidget('https://wallpapercave.com/wp/wp6363703.png',
          ExploreType.MULTI_IMAGE),
      ExploreItemWidget('https://wallpapercave.com/uwp/uwp131677.jpeg',
          ExploreType.SINGLE_IMAGE),
    ];
  }
}
