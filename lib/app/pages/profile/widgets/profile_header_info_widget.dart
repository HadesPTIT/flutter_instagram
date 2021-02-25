import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';

class ProfileHeaderInfoWidget extends StatefulWidget {
  @override
  _ProfileHeaderInfoWidgetState createState() =>
      _ProfileHeaderInfoWidgetState();
}

class _ProfileHeaderInfoWidgetState extends State<ProfileHeaderInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6)
          .copyWith(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: Assets.images.imagesSample,
              ),
              Expanded(child: _buildItem('Posts', '9,999')),
              Expanded(child: _buildItem('Followers', '6,818')),
              Expanded(child: _buildItem('Followings', '123')),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pham Trung Huong',
                  style: TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                ),
                SizedBox(height: 15),
                Text(
                  '🆃🅷🅸🅽🅺 🅱🅸🅶 🏝',
                  style: TextStyle(fontWeight: FontWeight.w100),
                ),
                Text(
                  'You can\'t start the next chapter of your life \nif you keep re-reading the last one 🔥🔥🔥🔥🔥',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 13, height: 1.5),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlineButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    onPressed: () {},
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: OutlineButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    onPressed: () {},
                    child: Text(
                      'Saved',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(String title, String value) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          SizedBox(height: 2),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
