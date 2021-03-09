import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/config/firestore_collection_path.dart';
import 'package:flutter_new_instagram/app/models/user_model.dart';

class Post extends Equatable {
  final String id;
  final String imageUrl;
  final String caption;
  final String location;
  final int numOfLikes;
  final int numOfComments;
  final User author;
  final DateTime dateTime;

  const Post({
    @required this.id,
    @required this.imageUrl,
    @required this.caption,
    @required this.location,
    @required this.numOfLikes,
    @required this.numOfComments,
    @required this.author,
    @required this.dateTime,
  });

  Post copyWith({
    String id,
    String imageUrl,
    String caption,
    String location,
    int numOfLikes,
    int numOfComments,
    User author,
    DateTime dateTime,
  }) {
    return Post(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
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
        imageUrl: '',
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
        imageUrl,
        caption,
        location,
        numOfLikes,
        numOfComments,
        author,
        dateTime
      ];

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
          imageUrl: data['imageUrl'] ?? '',
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

  Map<String, dynamic> toDocument() {
    return {
      'author': FirebaseFirestore.instance
          .collection(FireStoreCollectionPath.users)
          .doc(author.id),
      'imageUrl': imageUrl,
      'caption': caption,
      'location': location,
      'numOfLikes': numOfLikes,
      'numOfComments': numOfComments,
      'dateTime': Timestamp.fromDate(dateTime),
    };
  }
}
