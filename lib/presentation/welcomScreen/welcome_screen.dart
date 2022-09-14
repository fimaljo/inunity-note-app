import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inunity/presentation/login_screen/login_screen.dart';

import 'package:inunity/presentation/main_page/main_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        icon: Icon(Icons.arrow_right),
        label: Text("Lets'Go"),
        splashColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: introStack(size),
            ),
          ),
          Positioned(
            bottom: -size.height * 0.2,
            right: -size.height * 0.15,
            child: TweenAnimationBuilder<double>(
              duration: const Duration(microseconds: 250),
              tween: Tween(begin: 0, end: 1),
              builder: (context, value, _) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: value * (size.height * 0.4),
                  width: value * (size.height * 0.4),
                  decoration: BoxDecoration(
                    color: Colors.grey[500]!,
                    shape: BoxShape.circle,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Column introStack(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.1,
        ),
        Text(
          "Inunity",
          style: GoogleFonts.ubuntu(fontSize: 35, fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Capture what's on your mind & get a\nreminder later at the right place or time  You can also add voice memo & other features",
          style: GoogleFonts.ubuntu(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 300,
          // width: 400,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(55)),
              image: DecorationImage(
                  image: AssetImage(
                'assets/images/Taking notes-bro.png',
              ))),
        ),
      ],
    );
  }
}
