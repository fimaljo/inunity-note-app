import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inunity/domain/note_model/note_model.dart';
import 'package:uuid/uuid.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> addNote(String noteTitile, String noteDescription, String uid,
      int priorityColor) async {
    String res = "some error pccured";
    try {
      String noteId = const Uuid().v1();
      Note note = Note(
          noteTitile: noteTitile,
          noteDescription: noteDescription,
          noteId: noteId,
          uid: uid,
          priorityColor: priorityColor);
      _firestore.collection('notes').doc(noteId).set(note.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> deleteNote(
    String noteId,
  ) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('notes').doc(noteId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> updateNote(
    String name,
    String description,
    String notesId,
    int priorityColor,
  ) async {
    String res = "some error pccured";
    try {
      _firestore.collection('notes').doc(notesId).update({
        'noteTitile': name,
        'noteDescription': description,
        'priorityColor': priorityColor
      });
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  // Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory =>
  //     _firestore.collection('notes').snapshots();
  // Stream<List<Note>> getProducts() {
  //   return _firestore
  //       .collection("notes") // gets collection
  //       .snapshots() // gets snapshots, loop through
  //       .map((snapshot) => snapshot.docs.map((doc) {
  //             // loop through docs
  //             final d = doc.data(); // for each doc get the data
  //             return Note.fromMap(d); // convert into a map
  //           }).toList()); // build a list out of the products mapping
  // }
//   Stream<QuerySnapshot<Map<String, dynamic>>> get notes =>
//       _firestore.collection('notes').doc()
}
