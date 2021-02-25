import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';

class CommentWidget extends StatelessWidget {
  final String sender;
  final String message;

  const CommentWidget({Key key, this.sender, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: Assets.images.imagesSample2,
          ),
          Expanded(
              child: Container(
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: sender,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: message,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontWeight: FontWeight.w400)),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: DefaultTextStyle(
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        child: Row(
                          children: [
                            Text('8h'),
                            SizedBox(width: 24),
                            Text('12 likes'),
                            SizedBox(width: 24),
                            Text('Reply')
                          ],
                        )),
                  )
                ],
              ),
            ),
          )),
          Container(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.favorite_border,
              size: 16,
            ),
          )
        ],
      ),
    );
  }
}
