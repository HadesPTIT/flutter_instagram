import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_new_instagram/app/config/config.dart';
import 'package:flutter_new_instagram/app/config/firestore_collection_path.dart';
import 'package:flutter_new_instagram/app/models/comment_model.dart';
import 'package:flutter_new_instagram/app/models/post_model.dart';

abstract class PostRepository {
  Future createNewPost({Post post});

  Future addNewComment({Post post, Comment comment});

  void likePost({int userID, Post post});

  void unlikePost({int userID, int postID});

  Future<List<Post>> getNewFeeds({@required String userId, String lastPostId});
}

class PostRepositoryImpl extends PostRepository {
  final FirebaseFirestore _firebaseFirestore;

  PostRepositoryImpl({FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future addNewComment({Post post, Comment comment}) {
    // TODO: implement addNewComment
    throw UnimplementedError();
  }

  @override
  Future createNewPost({Post post}) async {
    await _firebaseFirestore
        .collection(FireStoreCollectionPath.posts)
        .add(post.toDocument());
  }

  @override
  void likePost({int userID, Post post}) {
    // TODO: implement likePost
  }

  @override
  void unlikePost({int userID, int postID}) {
    // TODO: implement unLike
  }

  @override
  Future<List<Post>> getNewFeeds({String userId, String lastPostId}) async {
    QuerySnapshot postsSnapshot;
    if (lastPostId == null) {
      postsSnapshot = await _firebaseFirestore
          .collection(FireStoreCollectionPath.feeds)
          .doc(userId)
          .collection(FireStoreCollectionPath.userFeed)
          // .orderBy('date', descending: true)
          .limit(kPageSize)
          .get();
    } else {
      final lastPostDoc = await _firebaseFirestore
          .collection(FireStoreCollectionPath.feeds)
          .doc(userId)
          .collection(FireStoreCollectionPath.userFeed)
          .doc(lastPostId)
          .get();

      if (!lastPostDoc.exists) return [];

      postsSnapshot = await _firebaseFirestore
          .collection(FireStoreCollectionPath.feeds)
          .doc(userId)
          .collection(FireStoreCollectionPath.userFeed)
          // .orderBy('date', descending: true)
          .startAfterDocument(lastPostDoc)
          .limit(kPageSize)
          .get();
    }

    final posts = Future.wait(
        postsSnapshot.docs.map((e) => Post.fromDocument(e)).toList());
    return posts;
  }
}
