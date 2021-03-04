import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_new_instagram/app/config/firestore_collection_path.dart';
import 'package:flutter_new_instagram/app/models/comment_model.dart';
import 'package:flutter_new_instagram/app/models/post_model.dart';

abstract class PostRepository {
  Future createNewPost({Post post});

  Future addNewComment({Post post, Comment comment});

  void likePost({int userID, Post post});

  void unlikePost({int userID, int postID});

  Stream<List<Future<Post>>> getNewFeeds({String userId});
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
  Future createNewPost({Post post}) {
    // TODO: implement createNewPost
    throw UnimplementedError();
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
  Stream<List<Future<Post>>> getNewFeeds({String userId}) {
    final authorDocument = _firebaseFirestore
        .collection(FireStoreCollectionPath.users)
        .doc(userId);
    return _firebaseFirestore
        .collection(FireStoreCollectionPath.posts)
        .where('author', isEqualTo: authorDocument)
        .orderBy('date', descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) => Post.fromDocument(e)));
  }
}
