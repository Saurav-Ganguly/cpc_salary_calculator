import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryForm extends StatefulWidget {
  const EntryForm({super.key});

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'ENTER DETAILS',
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
