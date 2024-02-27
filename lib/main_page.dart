import 'package:cpc_salary_calculator/entry_form.dart';
import 'package:cpc_salary_calculator/salary_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget? displayPage;
  @override
  void initState() {
    displayPage = EntryForm(calculateSalary: calculateSalary);
    super.initState();
  }

  double taCalculation(ta, level, da) {
    if (ta == 'Higher TA') {
      if (level <= 2) {
        return 1350 + (1350 * da / 100);
      } else if (level <= 8) {
        return 3600 + (3600 * da / 100);
      } else {
        return 7200 + (7200 * da / 100);
      }
    } else if (ta == "Other City") {
      if (level <= 2) {
        return 900 + (900 * da / 100);
      } else if (level <= 8) {
        return 1800 + (1800 * da / 100);
      } else {
        return 3600 + (3600 * da / 100);
      }
    } else {
      return 0;
    }
  }

  double cghsCalculation(level) {
    if (level <= 5) {
      return 250;
    } else if (level <= 6) {
      return 450;
    } else if (level <= 11) {
      return 650;
    } else {
      return 1000;
    }
  }

  void calculateSalary({
    required int level,
    required int basicPay,
    required int da,
    required int hra,
    required String ta,
  }) {
    double finalDa = basicPay * da / 100;
    double finalHra = basicPay * hra / 100;
    double finalTa = taCalculation(ta, level, da);
    double cghs = cghsCalculation(level);
    double npsSelf = (basicPay + finalDa) * 10 / 100;
    double npsGov = (basicPay + finalDa) * 14 / 100;

    setState(() {
      displayPage = SalaryPage(
        basic: basicPay.toDouble(),
        da: finalDa,
        hra: finalHra,
        ta: finalTa,
        npsSelf: npsSelf,
        npsGov: npsGov,
        cghs: cghs,
      );
    });
  }

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
                  Color.fromARGB(255, 89, 165, 92),
                ],
              ),
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
            child: displayPage,
          ),
        ],
      ),
    );
  }
}
