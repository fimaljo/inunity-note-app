import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//sign up user
  Future<String> signupUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        //register user
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  } //sign up user

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        //register user
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
