// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_screen.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                MenuLetter("TIC", Colors.blue),
                MenuLetter("TAC", Colors.red),
                MenuLetter("TOE", Colors.blue),
              ],
            ),
            /*
            Container(
              width: 250.0,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: TextButton(
                child: Text(
                  "Single Player",
                  style: GoogleFonts.fredokaOne(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  // final player = AudioCache();
                  // player.play('playagain.mp3');
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (BuildContext context) => SinglePlayer()));
                },
              ),
            ),*/
            Container(
              width: 250.0,
              decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: TextButton(
                child: Text(
                  "Multiplayer",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  // final player = AudioCache();
                  // player.play('playagain.mp3');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MainScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuLetter extends StatelessWidget {
  final String title;
  final Color textC;
  const MenuLetter(
    this.title,
    this.textC,
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        color: textC,
        textStyle: Theme.of(context).textTheme.displayLarge,
        fontSize: 50,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
