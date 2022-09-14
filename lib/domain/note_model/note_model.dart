import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String noteTitile;
  final String noteDescription;
  final String noteId;
  final String uid;
  final int priorityColor;
  Note(
      {required this.noteTitile,
      required this.noteDescription,
      required this.noteId,
      required this.uid,
      required this.priorityColor});
  static Note fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Note(
        noteTitile: snapshot["noteTitile"],
        noteDescription: snapshot["noteDescription"],
        noteId: snapshot["noteId"],
        uid: snapshot["uid"],
        priorityColor: snapshot["priorityColor"]);
  }

  Map<String, dynamic> toJson() => {
        "noteTitile": noteTitile,
        "noteDescription": noteDescription,
        "noteId": noteId,
        "uid": uid,
        "priorityColor": priorityColor,
      };
}
