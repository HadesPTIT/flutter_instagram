import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/dummy/dummy.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmNewPostScreen extends StatefulWidget {
  @override
  _ConfirmNewPostScreenState createState() => _ConfirmNewPostScreenState();
}

class _ConfirmNewPostScreenState extends State<ConfirmNewPostScreen> {
  var _toggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 50,
        iconTheme: IconThemeData(color: Colors.black, size: 50.0),
        backgroundColor: Colors.white,
        title: Text('New Post',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            color: Colors.blue,
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNewPostHeaderItem(),
              _buildDivider(),
              ListTile(dense: true, leading: Text('Tag People')),
              _buildDivider(),
              ListTile(dense: true, leading: Text('Add Location')),
              _buildDivider(),
              _buildSuggestLocations(),
              _buildDivider(),
              ListTile(
                  dense: true,
                  leading: Text(
                    'Also post to',
                    style: TextStyle(fontSize: 15),
                  )),
              ListTile(
                dense: true,
                leading: Text('Facebook'),
                title: Container(
                  alignment: Alignment.centerRight,
                  child: Text('Trung Huong'),
                ),
                trailing: Switch(
                    value: _toggled,
                    activeColor: Colors.lightBlue,
                    activeTrackColor: Colors.lightBlueAccent,
                    onChanged: (bool value) {
                      setState(() {
                        _toggled = !_toggled;
                      });
                    }),
              ),
              ListTile(
                  dense: true,
                  leading: Text('Twitter'),
                  trailing: Switch(value: false, onChanged: null)),
              ListTile(
                dense: true,
                leading: Text('Tumblr'),
                trailing: Switch(value: false, onChanged: null),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestLocations() {
    return Container(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: locationListSuggest().length,
        itemBuilder: (context, index) {
          return locationListSuggest()[index];
        },
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 0.1,
      color: Colors.black,
    );
  }

  Widget _buildNewPostHeaderItem() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(radius: 16, backgroundImage: Assets.images.imagesSample),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 8),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Write a caption...', border: InputBorder.none),
              ),
            ),
          ),
          Container(
            width: 68,
            height: 68,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.asset(Assets.images.imagesSample2.assetName,
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}
