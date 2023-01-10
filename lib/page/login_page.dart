import 'package:face_auth_flutter/page/face_recognition/camera_page.dart';
import 'package:face_auth_flutter/utils/local_db.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    printIfDebug(LocalDB.getUser().name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: AppBar(
        //   title: const Text("Face Authentication"),
        //   centerTitle: true,
        // ),
        backgroundColor: Color.fromARGB(255, 241, 220, 220),

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome to Smart Ration App ",
                  style: GoogleFonts.raleway(
                    fontWeight:FontWeight.bold,
                    fontSize: 24,
                    ),
                  ),
                  // Spacer(),
                  const SizedBox(height: 20),
                  Container(
                    child:Image.asset("assets/imageOB-removebg-preview.png")
                  ),
                  const SizedBox(height: 10),
                  buildButton(
                    text: 'Register',
                    //icon: Icons.app_registration_rounded,
                    onClicked: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FaceScanScreen()));
                    },
                  ),
                  const SizedBox(height: 24),
                  buildButton(
                    text: 'Login',
                   // icon: Icons.login,
                    onClicked: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FaceScanScreen(
                                    user: LocalDB.getUser(),
                                  )));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildButton({
    required String text,
    // required IconData icon,
    required VoidCallback onClicked,
  }) =>InkWell(
    onTap: onClicked,
    child: Padding(
      padding:const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
        color:  Colors.deepPurple,
        borderRadius: BorderRadius.circular(12)),
        child: Center(child: Text(text,style: GoogleFonts.raleway(
          fontSize: 18.0,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),)),
      )
    ),
  );
      // ElevatedButton.icon(
      //   style: ElevatedButton.styleFrom(
      //     minimumSize: const Size.fromHeight(50),
      //   ),
      //   icon: Icon(icon, size: 26),
      //   label: Text(
      //     text,
      //     style: const TextStyle(fontSize: 20),
      //   ),
      //   onPressed: onClicked,
      // );
}
