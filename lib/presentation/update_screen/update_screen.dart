import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inunity/presentation/widgets/select_color.dart';
import 'package:inunity/presentation/widgets/text_titile.dart';
import 'package:inunity/presentation/widgets/text_write_note.dart';

class UpdateNoteScreen extends StatefulWidget {
  const UpdateNoteScreen({Key? key}) : super(key: key);

  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {
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

    final size = MediaQuery.of(context).size;
    return Scaffold(
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
              onTap: () {},
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
            onPressed: () {},
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
