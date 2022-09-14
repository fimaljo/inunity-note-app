import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String adminuid;

  final String email;

  const User({
    required this.adminuid,
    required this.email,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      adminuid: snapshot["adminuid"],
      email: snapshot["email"],
    );
  }

  Map<String, dynamic> toJson() => {
        "adminuid": adminuid,
        "email": email,
      };
}
