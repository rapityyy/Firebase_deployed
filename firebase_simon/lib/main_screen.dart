// ignore: prefer_const_constructors
// ignore_for_file: avoid_print, unused_import, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

// class MainScreen extends StatefulWidget {
//   MainScreen({Key? key}) : super(key: key);

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("TestData"),
//     );
//   }
// }

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Class constructor
  int level = 0;
  List<String> gamePattern = [];
  List<String> simonColors = ["blue", "green", "red", "yellow"];
  List<String> userChoice = [];
  bool gameStatus = false;

  // AudioPlayer audioPlayer = AudioPlayer();
  List<ValueNotifier<bool>> isActiveNotifiers =
      List.generate(4, (_) => ValueNotifier(false));

  @override
  Widget build(BuildContext context) {
    // Generate the first color
    if (!gameStatus) {
      //change level display
      nextColor(); // Generate first color
      gameStatus = true; // GAME START!!!!
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Repeat",
          style: GoogleFonts.pressStart2p(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white, size: 32), // size increased to 32
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Level
            Text(
              "Level $level",
              style: GoogleFonts.pressStart2p(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),

            //Buttons
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: isActiveNotifiers[1],
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return Material(
                            color: value ? Colors.lightGreen : Colors.green,
                            elevation: value ? 10 : 0,
                            child: InkWell(
                              onTap: () {
                                _tapped("green");
                              },
                              child: Center(
                                child: Text(
                                  "Green",
                                  style: GoogleFonts.pressStart2p(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: isActiveNotifiers[2],
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return Material(
                            color: value ? Colors.pink : Colors.red,
                            elevation: value ? 10 : 0,
                            child: InkWell(
                              onTap: () {
                                _tapped("red");
                              },
                              child: Center(
                                child: Text(
                                  "Red",
                                  style: GoogleFonts.pressStart2p(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: isActiveNotifiers[3],
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return Material(
                            color: value ? Colors.orange : Colors.yellow,
                            elevation: value ? 10 : 0,
                            child: InkWell(
                              onTap: () {
                                _tapped("yellow");
                              },
                              child: Center(
                                child: Text(
                                  "Yellow",
                                  style: GoogleFonts.pressStart2p(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: isActiveNotifiers[0],
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return Material(
                            color: value ? Colors.lightBlue : Colors.blue,
                            elevation: value ? 10 : 0,
                            child: InkWell(
                              onTap: () {
                                _tapped("blue");
                              },
                              child: Center(
                                child: Text(
                                  "Blue",
                                  style: GoogleFonts.pressStart2p(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),

            //Made by Anhhh
          ],
        ),
      ),
    );
  }

  /* ************************* FUNCTIONS ************************** */

  // NextSequence of Color

  void checkUserInput() {
    int userCurrentSize = userChoice.length - 1;
    if (gamePattern[userCurrentSize] == userChoice[userCurrentSize]) {
      if (gamePattern.length == userChoice.length) {
        nextColor();
      }
    } else {
      print("Game OVER");
      gameStatus = false;
      restartGame();
    }
  }

  void nextColor() {
    setState(() {
      userChoice = [];
      level++;

      Random random = Random();
      int randomIndex = random.nextInt(4);
      gamePattern.add(simonColors[randomIndex]);
      print('gamePattern = $gamePattern');
      playSequence();
    });
  }

  // User pressed a button
  void _tapped(chosenColor) {
    setState(() {
      userChoice.add(chosenColor);
      //playSound(chosenColor);
      checkUserInput();
    });
  }

  Future<void> playSequence() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    for (int i = 0; i < gamePattern.length; i++) {
      print('sequence$i : ${gamePattern[i]}');
      int colorIndex = simonColors.indexOf(gamePattern[i]);
      isActiveNotifiers[colorIndex].value = true;
      await Future.delayed(const Duration(milliseconds: 500));
      isActiveNotifiers[colorIndex].value = false;

      // Providing delay between each button activation
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  void playSound(chosenColor) {
    String url = "";
    url = '$chosenColor.mp3';
    print(url);
    // audioPlayer.play(url);
    // final player = AudioCache();
    // player.play(url);
    // playLocal(url);

    //final player = AudioCache();
    //player.play('assets/sounds/' + chosenColor.toString() + '.mp3');
  }

  void restartGame() {
    level = 0;
    gamePattern = [];
    userChoice = [];
    gameStatus = false;
  }
}

// Border buildBorder() {
//   return Border(
//     left: bs,
//     top: bs,
//   );
// }
