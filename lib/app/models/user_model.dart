import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String bio;
  final int followers;
  final int followings;

  @override
  bool get stringify => true;

  const User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.avatarUrl,
    @required this.bio,
    @required this.followers,
    @required this.followings,
  });

  factory User.empty() {
    return User(
      id: '',
      name: '',
      email: '',
      avatarUrl: '',
      followers: 0,
      followings: 0,
      bio: '',
    );
  }

  User copyWith({
    String id,
    String name,
    String email,
    String avatarUrl,
    String bio,
    int followers,
    int followings,
  }) {
    return new User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      bio: bio ?? this.bio,
      followers: followers ?? this.followers,
      followings: followings ?? this.followings,
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return new User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      avatarUrl: map['avatarUrl'] as String,
      bio: map['bio'] as String,
      followers: map['followers'] as int,
      followings: map['followings'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'avatarUrl': this.avatarUrl,
      'bio': this.bio,
      'followers': this.followers,
      'followings': this.followings,
    } as Map<String, dynamic>;
  }

  @override
  List<Object> get props =>
      [id, name, email, avatarUrl, bio, followers, followings];

  factory User.fromDocument(DocumentSnapshot doc) {
    if (doc == null) return null;
    final data = doc.data();
    return User(
      id: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      avatarUrl: data['avatarUrl'] ?? '',
      followers: (data['followers'] ?? 0).toInt(),
      followings: (data['followings'] ?? 0).toInt(),
      bio: data['bio'] ?? '',
    );
  }
}
