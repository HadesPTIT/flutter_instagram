import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/models/user_model.dart';

class Post extends Equatable {
  final String id;
  final String avatarUrl;
  final String caption;
  final String location;
  final int numOfLikes;
  final int numOfComments;
  final User author;
  final DateTime dateTime;

  const Post({
    @required this.id,
    @required this.avatarUrl,
    @required this.caption,
    @required this.location,
    @required this.numOfLikes,
    @required this.numOfComments,
    @required this.author,
    @required this.dateTime,
  });

  Post copyWith({
    String id,
    String avatarUrl,
    String caption,
    String location,
    int numOfLikes,
    int numOfComments,
    User author,
    DateTime dateTime,
  }) {
    return Post(
      id: id ?? this.id,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      caption: caption ?? this.caption,
      location: location ?? this.location,
      numOfLikes: numOfLikes ?? this.numOfLikes,
      numOfComments: numOfComments ?? this.numOfComments,
      author: author ?? this.author,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  factory Post.empty() {
    return Post(
        id: '',
        avatarUrl: '',
        caption: '',
        location: '',
        numOfLikes: 0,
        numOfComments: 0,
        author: null,
        dateTime: null);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        id,
        avatarUrl,
        caption,
        location,
        numOfLikes,
        numOfComments,
        author,
        dateTime
      ];

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as String,
      avatarUrl: map['avatarUrl'] as String,
      caption: map['caption'] as String,
      location: map['location'] as String,
      numOfLikes: map['numOfLikes'] as int,
      numOfComments: map['numOfComments'] as int,
      author: map['author'] as User,
      dateTime: map['dateTime'] as DateTime,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'avatarUrl': this.avatarUrl,
      'caption': this.caption,
      'location': this.location,
      'numOfLikes': this.numOfLikes,
      'numOfComments': this.numOfComments,
      'author': this.author,
      'dateTime': this.dateTime,
    } as Map<String, dynamic>;
  }

  static Future<Post> fromDocument(DocumentSnapshot doc) async {
    if (doc == null) return null;
    final data = doc.data();
    final authorRef = data['author'] as DocumentReference;
    if (authorRef != null) {
      final authorDoc = await authorRef.get();
      if (authorDoc.exists) {
        return Post(
          id: doc.id,
          author: User.fromDocument(authorDoc),
          avatarUrl: data['avatarUrl'] ?? '',
          caption: data['caption'] ?? '',
          location: data['location'],
          numOfLikes: (data['numOfLikes'] ?? 0),
          numOfComments: (data['numOfComments'] ?? 0),
          dateTime: (data['dateTime'] as Timestamp)?.toDate(),
        );
      }
    }
    return null;
  }
}
