import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/pages/comment/comments_screen.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FeedWidget extends StatefulWidget {
  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        _buildContent(),
        _buildActions(),
        _buildFooter()
      ],
    );
  }

  Widget _buildActions() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 2),
      child: Row(
        children: [
          InkResponse(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(Assets.images.icHeartOutline,
                  width: 22, height: 22, color: Colors.black),
            ),
          ),
          InkResponse(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(Assets.images.icCommentV3,
                  width: 22, height: 22, color: Colors.black),
            ),
          ),
          InkResponse(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(Assets.images.icSendV3,
                  width: 22, height: 22, color: Colors.black),
            ),
          ),
          Spacer(),
          InkResponse(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(Assets.images.icBookmark,
                  width: 22, height: 22, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '666,888 likes',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Hades',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
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
          InkWell(
            child: Container(
              child: Text(
                'View all 238 comments',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontSize: 13.5),
              ),
              padding: EdgeInsets.symmetric(vertical: 4),
            ),
            onTap: () {
              Get.to(CommentsScreen());
            },
          ),
          Text(
            '7 days ago',
            style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: CachedNetworkImage(
          imageUrl: 'https://wallpapercave.com/uwp/uwp556880.jpeg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 16,
              backgroundImage:
                  NetworkImage('https://i.ibb.co/3dhG6cS/kim-joo-jung.jpg')),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Hades',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0)),
                    Text(' • '),
                    Text(
                      'Follow',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  'San Antonio, Texas',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.0,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
          )),
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                showDialog(
                    context: context,
                    child: Dialog(
                      child: ListView(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shrinkWrap: true,
                          children: [
                            'Report...',
                            'Turn on Post notifications',
                            'Copy Link',
                            'Share to...',
                            'Mute'
                          ]
                              .map((e) => InkWell(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      child: Text(e),
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ))
                              .toList()),
                    ));
              })
        ],
      ),
    );
  }
}
