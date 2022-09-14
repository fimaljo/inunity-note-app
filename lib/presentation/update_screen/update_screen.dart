import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inunity/core/utils.dart';

import 'package:inunity/presentation/widgets/select_color.dart';

import 'package:inunity/presentation/widgets/text_write_note.dart';

import '../../infrastructure/firestore_methods/firestore_methods.dart';

class UpdateScreen extends StatefulWidget {
  final snap;
  const UpdateScreen({Key? key, required this.snap}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  Color color = Colors.red;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    emailController.text = widget.snap['noteTitile'];
    passwordController.text = widget.snap['noteDescription'];
    super.initState();
  }

  deleteNote(
    String categoryId,
  ) async {
    try {
      await FirestoreService().deleteNote(categoryId);
      Utils.showSnackBar("Note Deleted Successfully");
      Navigator.pop(context);
    } catch (err) {
      log(err.toString());
    }
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
          "Update notes",
          style: GoogleFonts.ubuntu(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {
                deleteNote(widget.snap['noteId']!);
              },
              child: Container(
                height: 20,
                width: 40,
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              await FirestoreService().updateNote(emailController.text,
                  passwordController.text, widget.snap['noteId']!, value1);
              Utils.showSnackBar("Note Updated");
              Navigator.pop(context);
            },
            child: Text(
              "Save",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Text(
            //     "Select Priority Color",
            //     style: GoogleFonts.ubuntu(fontSize: 15, color: Colors.black),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
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
            TextField(
              controller: emailController,
              style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  contentPadding: EdgeInsets.only(left: 10.0)),
            ),
            TextWriteNote(controller: passwordController),
          ],
        ),
      ),
    );
  }
}
