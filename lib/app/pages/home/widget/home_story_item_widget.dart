import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/models/story_model.dart';

class HomeStoryItemWidget extends StatelessWidget {
  final VoidCallback onItemPress;
  final double size;
  final Story story;

  const HomeStoryItemWidget({this.onItemPress, this.size, this.story});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemPress.call(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        children: [
          Container(
            width: size,
            height: size,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size / 2.0),
                gradient: SweepGradient(colors: [
                  Color.fromARGB(255, 193, 53, 132),
                  Color.fromARGB(255, 245, 96, 64),
                  Color.fromARGB(255, 252, 175, 69),
                  Color.fromARGB(255, 245, 96, 64),
                  Color.fromARGB(255, 193, 53, 132),
                ]),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(size / 2.0),
                    child: Container(
                      color: Colors.green,
                        child: CachedNetworkImage(
                      placeholder: (context, url) => Container(
                        decoration: ShapeDecoration(
                            color: Colors.white, shape: CircleBorder()),
                      ),
                      imageUrl: story.user.avatarUrl,
                      fit: BoxFit.fill,
                    ))),
              ),
            ),
          ),
          Container(
            width: size,
            alignment: Alignment.center,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
              child: Text(
                story.user.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 10.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
