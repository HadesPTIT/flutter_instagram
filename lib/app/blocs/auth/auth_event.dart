part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}

class AuthUserChangedEvent extends AuthEvent {
  final auth.User user;

  AuthUserChangedEvent({@required this.user});

  @override
  List<Object> get props => [user];
}

class AuthUserLogoutEvent extends AuthEvent {}
