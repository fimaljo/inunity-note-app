import 'package:flutter/material.dart';
import 'package:inunity/presentation/add_note_screen/add_note_screen.dart';
import 'package:inunity/presentation/home/home_page.dart';
import 'package:inunity/presentation/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int pageIndex = 0;
  final pages = [
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildNavBar(size, context),
    );
  }

  Container buildNavBar(Size size, BuildContext context) {
    return Container(
      width: size.width,
      height: 70,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, 80),
            painter: BNBCustomPainter(),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
                backgroundColor: Colors.black,
                child: Icon(Icons.add),
                elevation: 0.1,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddNoteScreen(),
                    ),
                  );
                }),
          ),
          Container(
            width: size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: pageIndex == 0 ? Colors.white : Colors.grey.shade400,
                  ),
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  splashColor: Colors.white,
                ),
                Container(
                  width: size.width * 0.20,
                ),
                IconButton(
                  icon: Icon(
                    Icons.bookmark,
                    color: pageIndex == 1 ? Colors.white : Colors.grey.shade400,
                  ),
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
