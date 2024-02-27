import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SalaryPage extends StatelessWidget {
  const SalaryPage({
    super.key,
    required this.basic,
    required this.da,
    required this.hra,
    required this.ta,
    required this.npsSelf,
    required this.npsGov,
    required this.cghs,
  });
  final double basic;
  final double da;
  final double hra;
  final double ta;
  final double npsSelf;
  final double cghs;
  final double npsGov;

  @override
  Widget build(BuildContext context) {
    final netPay = basic + da + hra + ta - npsSelf - cghs;
    final grossPay = netPay + npsSelf + npsGov;

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              '- - SALARY - -',
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            DetailRow(
              label: 'Basic Pay :',
              value: basic.toString(),
              isBold: true,
            ),
            DetailRow(label: 'DA :', value: da.toString()),
            DetailRow(
              label: 'Basic Pay + DA :',
              value: (basic + da).toString(),
            ),
            DetailRow(
              label: '+ HRA :',
              value: hra.toString(),
            ),
            DetailRow(
              label: '+ TA :',
              value: ta.toString(),
            ),
            DetailRow(
              label: '- NPS (Self) :',
              value: npsSelf.toString(),
            ),
            DetailRow(
              label: '- CGHS :',
              value: cghs.toString(),
            ),
            Container(
              color: Colors.yellow,
              child: DetailRow(
                label: 'Net pay (in hand) :',
                value: netPay.toString(),
                isBold: true,
              ),
            ),
            DetailRow(
              label: '+ NPS (Self) :',
              value: npsSelf.toString(),
            ),
            DetailRow(
              label: '+ NPS (Gov) :',
              value: npsGov.toString(),
            ),
            Container(
              color: Colors.yellow,
              child: DetailRow(
                label: '+ Gross Pay (per month) :',
                value: grossPay.toString(),
                isBold: true,
              ),
            ),
            Container(
              color: Colors.yellow,
              child: DetailRow(
                label: '+ Gross Pay (per annum) :',
                value: (grossPay * 12).toString(),
                isBold: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Re-calculate"),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  DetailRow({
    super.key,
    required this.label,
    required this.value,
    this.isBold = false,
  });
  final String label;
  final String value;
  bool isBold;
  @override
  Widget build(BuildContext context) {
    final fontWeight = isBold ? FontWeight.bold : FontWeight.normal;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: fontWeight,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
