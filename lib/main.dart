import 'package:flutter/material.dart';
import 'package:ui_practice/screen/home_screen.dart';
import 'package:ui_practice/screen/muscin_player_screen.dart';

void main() {
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        '/musicPlayer': (context) => MusicPlayerSdreen()
      },
    );
  }
}
