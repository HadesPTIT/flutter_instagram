import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/pages/activity/widgets/activity_log_item.dart';
import 'package:flutter_new_instagram/app/pages/activity/widgets/follow_request_widget.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(22),
          child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 44,
                    alignment: Alignment.center,
                    child: Text(
                      'Activity',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                  )
                ],
              )),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1));
          },
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                  pinned: false,
                  floating: false,
                  delegate: SliverFollowRequestWidget()),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: [
                    _itemList()[index].buildItem(),
                    SizedBox(height: 10),
                  ],
                );
              }, childCount: _itemList().length))
            ],
          ),
        ),
      ),
    );
  }

  List<ActivityLogItem> _itemList() {
    List<ActivityLogItem> items = [];
    items.add(ActivityLogTimeItem('Today'));
    items.add(ActivityLogContentItem(2));
    items.add(ActivityLogContentItem(1));
    items.add(ActivityLogContentItem(2));
    items.add(ActivityLogContentItem(3));
    items.add(ActivityLogContentItem(2));
    items.add(ActivityLogTimeItem('Yesterday'));
    items.add(ActivityLogContentItem(1));
    items.add(ActivityLogContentItem(1));
    items.add(ActivityLogTimeItem('This Week'));
    items.add(ActivityLogContentItem(1));
    items.add(ActivityLogContentItem(1));
    items.add(ActivityLogContentItem(1));
    items.add(ActivityLogContentItem(1));
    items.add(ActivityLogContentItem(1));
    items.add(ActivityLogContentItem(1));
    items.add(ActivityLogTimeItem('This Month'));
    items.add(ActivityLogContentItem(2));
    items.add(ActivityLogContentItem(2));
    items.add(ActivityLogContentItem(2));
    items.add(ActivityLogContentItem(2));
    items.add(ActivityLogTimeItem('Ealier'));
    items.add(ActivityLogContentItem(2));
    return items;
  }
}
