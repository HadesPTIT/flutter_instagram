import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/blocs/feed/feed_view_model.dart';
import 'package:flutter_new_instagram/app/config/config.dart';
import 'package:flutter_new_instagram/app/repositories/auth/auth_repository.dart';
import 'package:flutter_new_instagram/app/repositories/post/post_repository.dart';

import 'feed_state.dart';
import 'dart:developer' as developer;

class FeedCubit extends Cubit<FeedState> {
  final PostRepository _postRepository;
  final AuthRepository _authRepository;

  FeedCubit({
    @required PostRepository postRepository,
    @required AuthRepository authRepository,
  })  : _postRepository = postRepository,
        _authRepository = authRepository,
        super(FeedInitialState());

  Future loadMore() async {
    developer.log("Hzzz loadMore");
  }

  Future run() async {
    developer.log("runnnn");
    emit(FeedLoadingState(FeedViewModel()));
    await Future.delayed(Duration(seconds: 1));

    final posts = await _postRepository.getNewFeeds(
        userId: 'pxzTg0cauvO7bCeW8NUD', lastPostId: null);

    if (posts == null) {
      emit(FeedErrorState(state.viewModel
          .copyWith(error: Exception('...')))); // Todo: detect error type
      return;
    }

    bool hasReachMax = posts.length < kPageSize;

    emit(FeedLoadedState(state.viewModel.copyWith(
        hasReachMax: hasReachMax, posts: state.viewModel.toNewPosts(posts))));

    // await _postRepository.createNewPost(
    //     post: Post(
    //         id: '1',
    //         avatarUrl: 'WTF',
    //         caption: 'Hello, my name is Hades',
    //         location: 'VN',
    //         numOfLikes: 6868,
    //         numOfComments: 999,
    //         author: User(
    //             id: 'EtIAt6jlZ5V52s6KI794rQJvcu92',
    //             name: 'Hades',
    //             email: 'Hphamptit@gmail.com',
    //             avatarUrl: 'https://no.me',
    //             bio: 'Nothing',
    //             followers: 123,
    //             followings: 456),
    //         dateTime: DateTime.now()));

    // Future.delayed(Duration(seconds: 1)).then((value) {
    //   emit(FeedLoadedState(posts: []));
    // });
  }
}
