import 'package:equatable/equatable.dart';
import 'package:flutter_new_instagram/app/models/post_model.dart';

class FeedViewModel extends Equatable {
  final bool hasReachMax;
  final List<Post> posts;
  final dynamic error;

  const FeedViewModel({this.hasReachMax, this.posts, this.error});

  @override
  List<Object> get props => [hasReachMax, posts, error];

  FeedViewModel copyWith({
    bool hasReachMax,
    List<Post> posts,
    dynamic error,
  }) {
    return FeedViewModel(
      hasReachMax: hasReachMax ?? this.hasReachMax,
      posts: posts ?? this.posts,
      error: error ?? this.error,
    );
  }

  @override
  bool get stringify => true;

  List<Post> toNewPosts(List<Post> newPosts) {
    if (posts == null) return newPosts;
    return posts..addAll(newPosts);
  }
}
