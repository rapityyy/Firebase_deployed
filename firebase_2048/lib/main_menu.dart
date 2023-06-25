import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_me.dart';
import 'main_game.dart';
import 'how_to_play.dart';

// import 'package:audioplayers/audioplayers.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  // AudioPlayer audioPlayer = AudioPlayer();
  // playLocal() async {
  //   int result = await audioPlayer.play("theme.mp3", isLocal: true);
  // }

  void startGame(context) {
    //playLocal();
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => const MainGame()));
  }

  void howToPlay(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => HowToPlay()));
  }

  void aboutMe(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => AboutMe()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "2048",
              style: GoogleFonts.roboto(
                color: Colors.white,
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 80,
                fontWeight: FontWeight.w100,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextButton(
                    onPressed: () => startGame(context),
                    child: Text(
                      "Classic Game",
                      style: GoogleFonts.roboto(
                        color: Colors.amber,
                        fontSize: 20,
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 50,
                    width: 150,
                    child: TextButton(
                        onPressed: () => howToPlay(context),
                        child: Text(
                          "How to Play",
                          style: GoogleFonts.roboto(
                            color: Colors.amber,
                            fontSize: 20,
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontWeight: FontWeight.w100,
                          ),
                        ))),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 50,
                    width: 150,
                    child: TextButton(
                        onPressed: () => aboutMe(context),
                        child: Text(
                          "About Me",
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: Colors.amber,
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontWeight: FontWeight.w100,
                          ),
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
