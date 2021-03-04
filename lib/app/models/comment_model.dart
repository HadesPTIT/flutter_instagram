import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/models/user_model.dart';

class Comment extends Equatable {
  final String id;
  final String postId;
  final User author;
  final String content;
  final DateTime date;

  @override
  List<Object> get props => [id, postId, author, content, date];

  @override
  bool get stringify => true;

  const Comment({
    @required this.id,
    @required this.postId,
    @required this.author,
    @required this.content,
    @required this.date,
  });

  Comment copyWith({
    String id,
    String postId,
    User author,
    String content,
    DateTime date,
  }) {
    return new Comment(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      author: author ?? this.author,
      content: content ?? this.content,
      date: date ?? this.date,
    );
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return new Comment(
      id: map['id'] as String,
      postId: map['postId'] as String,
      author: map['author'] as User,
      content: map['content'] as String,
      date: map['date'] as DateTime,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'postId': this.postId,
      'author': this.author,
      'content': this.content,
      'date': this.date,
    } as Map<String, dynamic>;
  }
}
