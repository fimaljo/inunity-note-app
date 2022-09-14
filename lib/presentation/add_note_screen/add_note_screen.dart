import 'package:flutter/material.dart';
import 'package:inunity/presentation/login_screen/widgets/text_field_container.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              // controller: controller,
              decoration: InputDecoration(
                // icon: Icon(icon),
                hintText: "Add Heading",
                border: InputBorder.none,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (email) =>
              //     email != null && !EmailValidator.validate(email)
              //         ? 'Enter a valid email'
              //         : null,
            ),
          ],
        ),
      ),
    );
  }
}
