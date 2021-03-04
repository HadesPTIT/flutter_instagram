import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/models/story_model.dart';
import 'package:flutter_new_instagram/app/models/user_model.dart';
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

final List<User> users = [
  User(
      id: '1',
      name: 'Davis',
      avatarUrl:
          'https://i.ibb.co/Sy7QVJT/Screen-Shot-2021-03-02-at-16-23-50.png'),
  User(
      id: '2',
      name: 'Sophie',
      avatarUrl:
          'https://i.ibb.co/wgNCCFV/Screen-Shot-2021-03-02-at-16-25-00.png'),
  User(
      id: '3',
      name: 'Hannah',
      avatarUrl:
          'https://i.ibb.co/LCMFqv9/Screen-Shot-2021-03-02-at-16-24-40.png'),
  User(
      id: '4',
      name: 'Hook',
      avatarUrl:
          'https://i.ibb.co/pR3NpJq/Screen-Shot-2021-03-02-at-16-23-59.png'),
  User(
      id: '5',
      name: 'Lucy',
      avatarUrl:
          'https://i.ibb.co/frBq8nn/Screen-Shot-2021-03-02-at-16-24-25.png'),
  User(
      id: '6',
      name: 'Cristina',
      avatarUrl:
          'https://i.ibb.co/pxfYF76/Screen-Shot-2021-03-02-at-16-24-31.png'),
  User(
      id: '7',
      name: 'Sooobela',
      avatarUrl:
          'https://i.ibb.co/pxfYF76/Screen-Shot-2021-03-02-at-16-24-31.png')
];

List<Story> stories = [
  Story(
    url: 'https://wallpapercave.com/wp/wp4558639.jpg',
    media: MediaType.image,
    duration: const Duration(seconds: 3),
    user: users[0],
  ),
  Story(
    url: 'https://wallpapercave.com/wp/wp8279752.jpg',
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: users[1],
  ),
  Story(
    url: 'https://media.giphy.com/media/daU0tYcdd6m0ICvPYf/giphy.gif',
    media: MediaType.image,
    user: users[2],
    duration: const Duration(seconds: 7),
  ),
  Story(
    url: 'https://ufile.io/f68lj8ou.mp4',
    media: MediaType.video,
    duration: const Duration(seconds: 0),
    user: users[3],
  ),
  Story(
    url: 'https://wallpapercave.com/wp/wp5493715.jpg',
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: users[4],
  ),
  Story(
    url: 'https://wallpapercave.com/wp/wp8091469.jpg',
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: users[5],
  ),
  Story(
    url: 'https://media.giphy.com/media/uy4GDuYbzyv7i/giphy.gif',
    media: MediaType.image,
    duration: const Duration(seconds: 4),
    user: users[0],
  )
];
