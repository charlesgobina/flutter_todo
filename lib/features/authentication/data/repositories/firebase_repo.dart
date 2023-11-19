// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:caasi_todo/features/authentication/data/model/user.dart';
import 'package:caasi_todo/features/authentication/utils/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  // initialize firebase auth
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  FirebaseRepository()
      : _firebaseAuth = FirebaseAuth.instance,
        _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUp(
      {required String name,
      required String phoneNumber,
      required String email,
      required String password}) async {
    UserCredential userCred = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    User user = userCred.user!;

    DocumentReference userRef =
        _firebaseFirestore.collection('users').doc(user.uid);

    AppUser userModel = AppUser(
      id: user.uid,
      name: name,
      email: email,
      phone: phoneNumber,
      password: HelperFunctions().hashPassword(password),
    );
    await userRef.set(userModel.toMap());
  }

  // is user signed in
  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  // write todo to firestore
  Future<void> writeTodoToFirestore(
      {required String title,
      required String description,
      required String date,
      required String time,
      required String userId}) async {
    DocumentReference todoRef = _firebaseFirestore.collection('todos').doc();

    await todoRef.set({
      'id': todoRef.id,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'userId': userId,
    });
  }

  // get current user
  Future<User?> getUser() async {
    return _firebaseAuth.currentUser;
  }

  // sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
