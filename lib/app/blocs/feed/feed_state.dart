part of 'feed_bloc.dart';

enum NewsFeedStatus { initial, loading, loaded, end, error }

class NewsFeedState extends Equatable {
  final List<Post> posts;
  final NewsFeedStatus status;
  final dynamic error;

  const NewsFeedState({
    @required this.posts,
    @required this.status,
    @required this.error,
  });

  factory NewsFeedState.initial() {
    return const NewsFeedState(
      posts: [],
      status: NewsFeedStatus.initial,
      error: null,
    );
  }

  bool get hasReachMax => status == NewsFeedStatus.end;

  NewsFeedState copyWith({
    List<Post> posts,
    NewsFeedStatus status,
    dynamic error,
  }) {
    return new NewsFeedState(
      posts: posts ?? this.posts,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [posts, status, error];

  @override
  bool get stringify => true;
}
