import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/dummy/dummy.dart';
import 'package:flutter_new_instagram/app/pages/comment/widget/comment_widget.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 50,
        iconTheme: IconThemeData(color: Colors.black, size: 50.0),
        backgroundColor: Colors.white,
        title: Text('Comments',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
        actions: [
          SvgPicture.asset(
            Assets.images.icSendV3,
            width: 24,
            height: 24,
          ),
          SizedBox(width: 12)
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: commentListDummy().length,
          itemBuilder: (context, index) {
            if (index == 0)
              return Padding(
                padding: const EdgeInsets.only(left: 16, top: 10, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: Assets.images.imagesSample,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Hades',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: ' '),
                              TextSpan(
                                  text:
                                      'The Maldives 🏝 are an archipelago of 1,192 islands grouped into 26 coral atolls in the Indian Ocean 🌊\n🌅🌅🌅',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(fontWeight: FontWeight.w400)),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 0.15,
                      color: Colors.black,
                    )
                  ],
                ),
              );
            return commentListDummy()[index];
          },
          separatorBuilder: (context, index) => SizedBox(width: 1.0),
        ),
      ),
      bottomNavigationBar: Material(
        type: MaterialType.canvas,
        child: SafeArea(
          child: Container(
            height: 80,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.white,
                  height: 30,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: emojiListDummy().length,
                    itemBuilder: (context, index) {
                      return emojiListDummy()[index];
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 20),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 16,
                          backgroundImage: Assets.images.imagesSample),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 16, right: 8),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Comment as Hades...',
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Text(
                            'Post',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText2
                                .copyWith(color: Colors.blue),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
