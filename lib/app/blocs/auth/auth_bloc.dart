import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/repositories/repositories.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<auth.User> _userSubscription;

  AuthBloc({@required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthState.unknown()) {
    _userSubscription = _authRepository.user
        .listen((user) => add(AuthUserChangedEvent(user: user)));
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthUserChangedEvent) {
      yield* _mapAuthUserChangedEventToState(event);
    } else if (event is AuthUserLogoutEvent) {
      await _authRepository.logout();
    }
  }

  Stream<AuthState> _mapAuthUserChangedEventToState(
      AuthUserChangedEvent event) async* {
    yield event.user == null
        ? AuthState.unauthenticated()
        : AuthState.authenticated(user: event.user);
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
