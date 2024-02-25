import 'package:cpc_salary_calculator/entry_form.dart';
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
                  colors: [
                    Color.fromARGB(255, 177, 107, 2),
                    Color.fromARGB(255, 252, 240, 240),
                    Color.fromARGB(255, 89, 165, 92)
                  ]),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/imgs/emblem.png'),
                  ),
                ),
                Text(
                  "7th CPC Salary Calculator",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 92, 92, 92)),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(
                30, MediaQuery.of(context).size.height * .28, 30, 0),
            height: MediaQuery.of(context).size.height * .60,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const EntryForm(),
          ),
        ],
      ),
    );
  }
}
