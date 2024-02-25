import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 207, 207),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .33,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // colors: [
                  //   Color(0xFFB6185B),
                  //   Color(0xFF851D92),
                  // ],
                  colors: [
                    Color.fromARGB(255, 177, 107, 2),
                    Color.fromARGB(255, 252, 240, 240),
                    Color.fromARGB(255, 89, 165, 92)
                  ]),
            ),
            child: const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/imgs/emblem.png'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                30, MediaQuery.of(context).size.height * .25, 30, 0),
            height: MediaQuery.of(context).size.height * .70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
