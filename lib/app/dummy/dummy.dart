import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/pages/comment/widget/comment_widget.dart';
import 'package:flutter_new_instagram/app/pages/explore/widgets/explore_item_widget.dart';

List<Widget> exploreListDummy() {
  return [
    ExploreItemWidget(
        'https://wallpapercave.com/wp/wp3156022.jpg', ExploreType.VIDEO),
    ExploreItemWidget(
        'https://wallpapercave.com/uwp/uwp9990.png', ExploreType.SINGLE_IMAGE),
    ExploreItemWidget(
        'https://wallpapercave.com/wp/wp3856709.jpg', ExploreType.MULTI_IMAGE),
    ExploreItemWidget(
        'https://wallpapercave.com/wp/wp7804681.jpg', ExploreType.SINGLE_IMAGE),
    ExploreItemWidget(
        'https://wallpapercave.com/wp/wp3856716.png', ExploreType.MULTI_IMAGE),
    ExploreItemWidget(
        'https://wallpapercave.com/wp/wp5376668.png', ExploreType.VIDEO),
    ExploreItemWidget(
        'https://wallpapercave.com/wp/wp7804706.jpg', ExploreType.MULTI_IMAGE),
    ExploreItemWidget(
        'https://wallpapercave.com/wp/wp2471312.jpg', ExploreType.SINGLE_IMAGE),
    ExploreItemWidget(
        'https://wallpapercave.com/wp/wp6363703.png', ExploreType.MULTI_IMAGE),
    ExploreItemWidget('https://wallpapercave.com/uwp/uwp131677.jpeg',
        ExploreType.SINGLE_IMAGE),
  ];
}

List<Widget> commentListDummy() {
  return [
    CommentWidget(
        sender: 'oldfartmel', message: ' same high class you show :D'),
    CommentWidget(sender: '_itz_about_quotes_', message: ' ❤️'),
    CommentWidget(sender: '943.aleksei', message: ' ❤️❤️'),
    CommentWidget(sender: 'min_', message: ' 🏂❄❄️'),
    CommentWidget(
        sender: 'oldfartmel',
        message:
            ' Keep your eyes on your end goal, amazing post keep up the good work🔥'),
    CommentWidget(sender: 'sidneyporten', message: ' Great post!!!')
  ];
}

List<Widget> emojiListDummy() {
  return [
    Text('🤗', style: TextStyle(fontSize: 20)),
    Text('😀', style: TextStyle(fontSize: 20)),
    Text('🤩', style: TextStyle(fontSize: 20)),
    Text('👻', style: TextStyle(fontSize: 20)),
    Text('☠️', style: TextStyle(fontSize: 20)),
    Text('😙', style: TextStyle(fontSize: 20)),
    Text('🤑', style: TextStyle(fontSize: 20)),
    Text('😀', style: TextStyle(fontSize: 20)),
    Text('🤩', style: TextStyle(fontSize: 20)),
    Text('👻', style: TextStyle(fontSize: 20)),
    Text('🤑', style: TextStyle(fontSize: 20)),
    Text('😙', style: TextStyle(fontSize: 20))
  ];
}

List<Widget> locationListSuggest() {
  return [
    Chip(label: Text('Da Nang')),
    Chip(label: Text('Hoi An')),
    Chip(label: Text('Nha Trang')),
    Chip(label: Text('Mui Ne')),
    Chip(label: Text('Ha Noi')),
    Chip(label: Text('Ha Long Bay')),
    Chip(label: Text('Hue'))
  ];
}
