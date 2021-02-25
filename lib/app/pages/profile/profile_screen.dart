import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/dummy/dummy.dart';
import 'package:flutter_new_instagram/app/pages/profile/widgets/bottom_sheet_action_widget.dart';
import 'package:flutter_new_instagram/app/pages/profile/widgets/profile_app_bar_widget.dart';
import 'package:flutter_new_instagram/app/pages/profile/widgets/profile_header_info_widget.dart';
import 'package:flutter_new_instagram/app/pages/profile/widgets/profile_highlights_widget.dart';
import 'package:flutter_new_instagram/app/pages/profile/widgets/profile_sliver_tabbar_delegate.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tuple/tuple.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
              headerSliverBuilder: (context, bodyIsScrolled) {
                return [
                  ProfileAppBarWidget(onShowMenu: () => _onShowMenu(context)),
                  SliverToBoxAdapter(child: ProfileHeaderInfoWidget()),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ProfileHighlightsWidget(),
                  )),
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: ProfileSliverPersistentHeaderTabBar(
                          child: Container(
                        color: Colors.white,
                        height: 50,
                        child: TabBar(
                          indicatorColor: Colors.orange,
                          tabs: [
                            Tab(
                                icon: Icon(
                              Icons.grid_on,
                              color: Colors.black,
                            )),
                            Tab(
                                icon: Icon(Icons.person_outline,
                                    color: Colors.black))
                          ],
                        ),
                      )))
                ];
              },
              body: TabBarView(children: [
                GridView.builder(
                    padding: EdgeInsets.all(2),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2),
                    itemCount: 40,
                    itemBuilder: (context, index) {
                      return exploreListDummy()[index % 10];
                    }),
                GridView.builder(
                    padding: EdgeInsets.all(2),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2),
                    itemCount: 40,
                    itemBuilder: (context, index) {
                      return exploreListDummy()[index % 10];
                    })
              ])),
        ),
      ),
    );
  }

  void _onShowMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey),
                    ),
                  ),
                  Text('Create New',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  SizedBox(height: 10),
                  Container(height: 0.1, color: Colors.black),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: kActions.length,
                    itemBuilder: (context, index) {
                      return BottomSheetActionWidget(kActions[index], null);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  List<Tuple2> get kActions => [
        Tuple2(Assets.images.icFeedPost, 'Feed Post'),
        Tuple2(Assets.images.icStory, 'Story'),
        Tuple2(Assets.images.icStoryHighlight, 'Story Highlight'),
        Tuple2(Assets.images.icIgtvVideo, 'IGTV Video'),
        Tuple2(Assets.images.icGuide, 'Guide')
      ];
}
