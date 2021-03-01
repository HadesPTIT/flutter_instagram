import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_instagram/app/config/firestore_collection_path.dart';
import 'package:flutter_new_instagram/app/models/failure_model.dart';

abstract class AuthRepository {
  Stream<auth.User> get user;

  Future<auth.User> signUpWithEmailPassword(
      {String userName, String email, String password});

  Future<auth.User> loginWithEmailPassword({String email, String password});

  Future logout();
}

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseFirestore _fireStore;
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(
      {FirebaseFirestore fireStore, auth.FirebaseAuth firebaseAuth})
      : _fireStore = fireStore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Stream<auth.User> get user => _firebaseAuth.userChanges();

  @override
  Future<auth.User> signUpWithEmailPassword(
      {@required String userName,
      @required String email,
      @required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      _fireStore.collection(FireStoreCollectionPath.users).doc(user.uid).set({
        'username': userName,
        'email': email,
        'followers': 0,
        'following': 0
      });
      return user;
    } on auth.FirebaseAuthException catch (e) {
      throw Failure(code: e.code, message: e.message);
    } on PlatformException catch (e) {
      throw Failure(code: e.code, message: e.message);
    }
  }

  @override
  Future<auth.User> loginWithEmailPassword(
      {@required String email, @required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on auth.FirebaseAuthException catch (err) {
      throw Failure(code: err.code, message: err.message);
    } on PlatformException catch (err) {
      throw Failure(code: err.code, message: err.message);
    }
  }

  @override
  Future logout() async {
    await _firebaseAuth.signOut();
  }
}
