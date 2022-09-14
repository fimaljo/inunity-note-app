import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inunity/infrastructure/firestore_methods/firestore_methods.dart';
import 'package:inunity/presentation/add_note_screen/add_note_screen.dart';
import 'package:inunity/presentation/update_screen/update_screen.dart';
import 'package:inunity/presentation/widgets/shimmer.dart';
import 'package:lottie/lottie.dart';

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
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            color: Colors.black,
            icon: Icon(Icons.logout),
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
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('notes').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.data != null) {
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("No Notes yet..."),
                          Lottie.asset(
                            "assets/anim/110457-notes-document.json",
                            width: 200,
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UpdateScreen(
                                snap: snapshot.data!.docs[index].data(),
                              ),
                            ),
                          );
                        },
                        child: NotesCard(
                          snap: snapshot.data!.docs[index].data(),
                        ),
                      );
                    },
                  );
                }
                return const ShimmerWidget(height: 90);
              },
            ),
          )
        ],
      ),
    );
  }
}

class NotesCard extends StatefulWidget {
  final snap;
  const NotesCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  @override
  Widget build(BuildContext context) {
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
                fit: BoxFit.cover, image: AssetImage("assets/images/note.png")),
          ),
          child: Column(
            children: [
              Text(
                widget.snap['noteTitile'],
                style: GoogleFonts.ubuntu(
                    fontSize: 15, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  widget.snap['noteDescription']!,
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
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Color(widget.snap['priorityColor']!),
                      radius: 7,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
