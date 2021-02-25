import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SelfStoryItemWidget extends StatelessWidget {
  final VoidCallback onItemPress;
  final double size;

  const SelfStoryItemWidget({this.onItemPress, this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemPress,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white30,
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    )
                  ],
                  borderRadius: BorderRadius.circular(size / 2.0),
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white30,
                    width: 3,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(size / 2.0),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                      child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl:
                              'https://i.ibb.co/3dhG6cS/kim-joo-jung.jpg'),
                    ),
                  ),
                ),
              ),
              Container(
                width: size,
                height: size,
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: ShapeDecoration(
                      color: Colors.white, shape: CircleBorder()),
                  child: Icon(
                    Icons.add_circle_outlined,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          Container(
            width: size,
            alignment: Alignment.center,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
              child: Text(
                'Your story',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
