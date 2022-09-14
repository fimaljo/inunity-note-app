import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inunity/presentation/widgets/circle.dart';
import 'package:inunity/presentation/widgets/select_color.dart';
import 'package:inunity/presentation/widgets/text_titile.dart';
import 'package:inunity/presentation/widgets/text_write_note.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();

      super.dispose();
    }

    return Scaffold(
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
              onPressed: () {},
              child: Text(
                "Save",
              ))
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Select Priority Color"),
            ),
            const SizedBox(
              height: 10,
            ),
            SelectedColors(),
            const SizedBox(
              height: 10,
            ),
            TextTitle(controller: emailController),
            TextWriteNote(controller: passwordController),
          ],
        ),
      ),
    );
  }
}
