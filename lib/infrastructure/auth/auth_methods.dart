import 'package:inunity/domain/user_model/user_model.dart' as model;
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
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // model.User _user = model.User(
        //   adminuid: cred.user!.uid,
        //   email: email,
        // );
        // await _firestore
        //     .collection("user")
        //     .doc(cred.user!.uid)
        //     .set(_user.toJson());
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
