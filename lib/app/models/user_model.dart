import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String avatarUrl;

  const User({
    @required this.id,
    @required this.name,
    @required this.avatarUrl,
  });

  User copyWith({
    String name,
    String avatarUrl,
  }) {
    return new User(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, avatarUrl];
}
