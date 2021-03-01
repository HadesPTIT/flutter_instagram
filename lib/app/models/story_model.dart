import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/models/user_model.dart';

enum MediaType { image, video }

class Story extends Equatable {
  final String url;
  final MediaType media;
  final Duration duration;
  final User user;

  const Story(
      {@required this.url,
      @required this.media,
      @required this.duration,
      @required this.user});

  Story copyWith({String url, MediaType media, Duration duration, User user}) {
    return new Story(
        url: url ?? this.url,
        media: media ?? this.media,
        duration: duration ?? this.duration,
        user: user ?? this.user);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [url, media, duration, user];
}
