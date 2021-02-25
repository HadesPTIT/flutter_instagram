import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/pages/post/confirm/confirm_new_post_screen.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:get/get.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(22),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () {},
              ),
              Spacer(),
              InkResponse(
                  child: Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  onTap: () => Get.to(ConfirmNewPostScreen())),
              SizedBox(width: 12)
            ],
          )),
        ),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        Assets.images.imagesSample2.assetName,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Container(
                                child: IconButton(
                                    icon: Icon(
                                      Icons.zoom_out_map,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {}),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54)),
                            Expanded(child: Container()),
                            Container(
                                child: IconButton(
                                    icon: Icon(Icons.camera,
                                        size: 16, color: Colors.white),
                                    onPressed: () {}),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54)),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                                child: IconButton(
                                    icon: Icon(Icons.format_shapes,
                                        size: 16, color: Colors.white),
                                    onPressed: () {}),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54)),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                                child: IconButton(
                                    icon: Icon(Icons.content_copy,
                                        size: 16, color: Colors.white),
                                    onPressed: () {}),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54))
                          ],
                        ),
                      ),
                      bottom: 0,
                      left: 0,
                      right: 0,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2),
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return InkResponse(
                        child: Image.asset(
                          Assets.images.imagesSample.assetName,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {},
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
