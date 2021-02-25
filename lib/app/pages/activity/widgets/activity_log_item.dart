import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';

abstract class ActivityLogItem {
  Widget buildItem();
}

class ActivityLogTimeItem implements ActivityLogItem {
  final String dateTime;

  ActivityLogTimeItem(this.dateTime);

  @override
  Widget buildItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          dateTime,
          style: TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class ActivityLogContentItem implements ActivityLogItem {
  final int type;

  ActivityLogContentItem(this.type);

  @override
  Widget buildItem() {
    switch (type) {
      case 1:
        {
          return _buildLogType1();
        }
      case 2:
        {
          return _buildLogType2();
        }
      case 3:
        {
          return _buildLogType3();
        }
      default:
        {
          return SizedBox();
        }
    }
  }

  Widget _buildLogType1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: Assets.images.imagesSample,
            ),
            SizedBox(width: 16),
            Expanded(
              child: RichText(
                maxLines: 2,
                text: TextSpan(
                    text: '',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        height: 1.2,
                        fontSize: 13),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'cuong_lo_renn',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: ', ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300)),
                      TextSpan(
                          text: 'Hades',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: ' and ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300)),
                      TextSpan(
                          text: 'bump.gethigh',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: ' liked your photo',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300)),
                      TextSpan(
                          text: '. 1h',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w300)),
                    ]),
              ),
            ),
            SizedBox(width: 20),
            Container(
              width: 60,
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                    imageUrl: 'https://wallpapercave.com/uwp/uwp9990.png',
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogType2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: Assets.images.imagesSample2,
            ),
            SizedBox(width: 16),
            Expanded(
              child: RichText(
                maxLines: 2,
                text: TextSpan(
                    text: 'Since you follow ',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        height: 1.2,
                        fontSize: 13),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Lionel Messi',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: ', you might like ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300)),
                      TextSpan(
                          text: 'Cristiano Ronaldo',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: '. 1h',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w300)),
                    ]),
              ),
            ),
            SizedBox(width: 20),
            ButtonTheme(
              height: 27,
              minWidth: 30,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () => {},
                child: Text(
                  "Follow",
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogType3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(right: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: Assets.images.imagesSample,
            ),
            SizedBox(width: 16),
            Expanded(
              child: RichText(
                maxLines: 2,
                text: TextSpan(
                    text: '',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        height: 1.28,
                        fontSize: 13),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'lady.bibiho_93',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: ', ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300)),
                      TextSpan(
                          text: 'MiCheal Riz Kul',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: ' and others shared 124 photos 🍉 💥 🐾 🐾 🏄',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300)),
                      TextSpan(
                          text: '. 1h',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w300)),
                    ]),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
