import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_new_instagram/app/config/config.dart';
import 'package:flutter_new_instagram/app/models/post_model.dart';
import 'package:flutter_new_instagram/app/repositories/auth/auth_repository.dart';
import 'package:flutter_new_instagram/app/repositories/post/post_repository.dart';
import 'package:flutter_new_instagram/app/utils/network_state_mixin.dart';
import 'package:bloc/bloc.dart';
import 'dart:developer' as dev;

part 'feed_state.dart';

enum ErrorType { NETWORK, SERVER, OTHER }

class FeedCubit extends Cubit<NewsFeedState> with NetworkStateMixin {
  final PostRepository _postRepository;
  final AuthRepository _authRepository;

  FeedCubit({
    @required PostRepository postRepository,
    @required AuthRepository authRepository,
  })  : _postRepository = postRepository,
        _authRepository = authRepository,
        super(NewsFeedState.initial()) {}

  Future run({bool loadMore = false}) async {
    bool isConnected = await checkNetwork();
    if (!isConnected) {
      emit(state.copyWith(
          status: NewsFeedStatus.error, error: ErrorType.NETWORK));
      return;
    }
    dev.log('WTFFF GO HERE');
    if (!loadMore) {
      emit(state.copyWith(status: NewsFeedStatus.loading));
    }
    await Future.delayed(Duration(seconds: 1));

    final lastPostID = state.posts.isNotEmpty ? state.posts.last.id : null;
    final posts = await _postRepository.getNewFeeds(
        userId: 'pxzTg0cauvO7bCeW8NUD', lastPostId: lastPostID);

    if (posts == null) {
      emit(state.copyWith(
          status: NewsFeedStatus.error, error: ErrorType.SERVER));
      return;
    }

    bool hasReachMax = posts.length < kPageSize;

    final oldPosts = [...state.posts];
    if (hasReachMax) {
      emit(state.copyWith(
          posts: oldPosts..addAll(posts), status: NewsFeedStatus.end));
    }
    emit(state.copyWith(
        posts: oldPosts..addAll(posts), status: NewsFeedStatus.loaded));
    dev.log('NEW POST LENGTH : ${state.posts.length}');
  }
}
