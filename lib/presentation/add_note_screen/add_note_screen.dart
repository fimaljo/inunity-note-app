import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inunity/core/utils.dart';
import 'package:inunity/presentation/widgets/select_color.dart';
import 'package:inunity/presentation/widgets/text_titile.dart';
import 'package:inunity/presentation/widgets/text_write_note.dart';

import '../../infrastructure/firestore_methods/firestore_methods.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  Color color = Colors.red;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  _addNote(String uid, int priorityColor) async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) return;
    {
      String res = await FirestoreService().addNote(
          titleController.text, descriptionController.text, uid, priorityColor);

      if (res == "success") {
        Utils.showSnackBar("Note created successfully");
        Navigator.pop(context);
      }
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  Widget buildColorPicker() => ColorPicker(
        pickerColor: color,
        onColorChanged: (color) => setState(() => this.color = color),
      );

  void pickColor(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Pick Color"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildColorPicker(),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Select")),
              ],
            ),
          ));
  @override
  Widget build(BuildContext context) {
    final int value1 = color.value;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Text(
          "Add notes",
          style: GoogleFonts.ubuntu(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                _addNote(_auth.currentUser!.uid, value1);
              },
              child: Text(
                "Save",
                style: GoogleFonts.ubuntu(color: Colors.black),
              ))
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => pickColor(context),
                  child: Text(
                    "Select Priority Color",
                    style: GoogleFonts.ubuntu(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextTitle(controller: titleController),
              TextWriteNote(controller: descriptionController),
            ],
          ),
        ),
      ),
    );
  }
}
