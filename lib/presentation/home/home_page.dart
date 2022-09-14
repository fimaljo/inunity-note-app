import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inunity/presentation/add_note_screen/add_note_screen.dart';
import 'package:inunity/presentation/update_screen/update_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final style = TextStyle(
    fontSize: 35,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: const [
          Icon(
            Icons.person,
            color: Colors.black,
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Creat and",
                  style: GoogleFonts.ubuntu(fontSize: 20),
                ),
                Text(
                  "design",
                  style: GoogleFonts.ubuntu(fontSize: 20),
                ),
                Text(
                  "Your notes",
                  style: GoogleFonts.ubuntu(textStyle: style),
                ),
                Text(
                  "easily",
                  style: GoogleFonts.ubuntu(textStyle: style),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(177, 158, 158, 158),
                        offset: const Offset(4, 4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        const Icon(Icons.search),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Search",
                          style: GoogleFonts.ubuntu(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Notes",
                  style: GoogleFonts.ubuntu(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Transform.translate(
                    offset: Offset(20, 0),
                    child: Container(
                      height: 90,
                      width: 220,
                      //margin: EdgeInsets.only(top: index == indexPage ? 0 : 5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500]!,
                            offset: const Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/note.png")),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UpdateNoteScreen(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Text(
                              "Heading",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 15, fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text(
                                "Capture what's on your mind & get a reminder later at the right place or time  You can also add voice memo & other featuresCapture what's on your mind & get a reminder later at the right place or time  You can also add voice memo & other features",
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.ubuntu(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Row(
                                children: [
                                  Text(
                                    "Priority Color",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    radius: 7,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
