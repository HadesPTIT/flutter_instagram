import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/blocs/feed/feed_bloc.dart';
import 'package:flutter_new_instagram/app/models/post_model.dart';
import 'package:flutter_new_instagram/app/pages/comment/comments_screen.dart';
import 'package:flutter_new_instagram/app/utils/string_utils.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FeedWidget extends StatefulWidget {
  final Post post;
  final bool isLiked;
  final VoidCallback onLike;

  const FeedWidget({this.post, this.isLiked, this.onLike});

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
            onTap: () {
              widget.onLike.call();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: widget.isLiked
                  ? SvgPicture.asset(Assets.images.icHeartOutline,
                      width: 22, height: 22, color: Colors.black)
                  : SvgPicture.asset(Assets.images.icHeartFilled,
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
            StringUtils.numberFormatter(
                value: widget.post.numOfLikes, suffix: 'likes'),
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: widget.post.author.name,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              TextSpan(text: ' '),
              TextSpan(
                  text: widget.post.caption,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.w400)),
            ]),
          ),
          InkWell(
            child: Container(
              child: Text(
                'View all ${widget.post.numOfComments} comments',
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
            StringUtils.timeAgoSinceDate(widget.post.dateTime),
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
          imageUrl: widget.post.imageUrl,
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
              backgroundImage: NetworkImage(widget.post.author.avatarUrl)),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.post.author.name,
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
                  widget.post.location,
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
