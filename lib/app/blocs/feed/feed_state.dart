import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_new_instagram/app/blocs/feed/feed_view_model.dart';
import 'package:flutter_new_instagram/app/models/post_model.dart';

abstract class FeedState extends Equatable {
  final FeedViewModel viewModel;

  const FeedState(this.viewModel);
}

class FeedInitialState extends FeedState {
  const FeedInitialState() : super(null);

  @override
  List<Object> get props => [];
}

class FeedLoadingState extends FeedState {
  const FeedLoadingState(viewModel) : super(viewModel);

  @override
  List<Object> get props => [viewModel];
}

class FeedErrorState extends FeedState {
  const FeedErrorState(viewModel) : super(viewModel);

  @override
  List<Object> get props => [viewModel];
}

class FeedLoadedState extends FeedState {
  const FeedLoadedState(viewModel) : super(viewModel);

  @override
  List<Object> get props => [viewModel];
}
