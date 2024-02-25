import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryForm extends StatefulWidget {
  const EntryForm({super.key});

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final List<int> _levelsList = List.generate(18, (index) => index + 1);
  final List<String> _taSelection = ['Higher TA', 'Other City', 'No TA'];
  int? _selectedLevel;
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
          const SizedBox(
            height: 20,
          ),
          DropdownButtonFormField(
            hint: const Text("Select Level"),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person_outline_sharp),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            value: _selectedLevel,
            items: _levelsList
                .map(
                  (level) => DropdownMenuItem(
                    value: level,
                    child: Text(
                      'Level ${level.toString()}',
                    ),
                  ),
                )
                .toList(),
            onChanged: (level) {},
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Basic Pay',
              prefixIcon: const Icon(Icons.currency_rupee),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'DA (in %)',
                    hintText: "46",
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'HRA (in %)',
                    hintText: "27",
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButtonFormField(
            hint: const Text("Travel Allowence"),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.bike_scooter_outlined),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            value: _selectedLevel,
            items: _taSelection
                .map(
                  (taType) => DropdownMenuItem(
                    value: taType,
                    child: Text(
                      taType,
                    ),
                  ),
                )
                .toList(),
            onChanged: (taType) {},
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Reset'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Calculate"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
