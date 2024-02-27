import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryForm extends StatefulWidget {
  const EntryForm({super.key, required this.calculateSalary});

  final void Function({
    required int level,
    required int basicPay,
    required int da,
    required int hra,
    required String ta,
  }) calculateSalary;
  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final List<int> _levelsList = List.generate(18, (index) => index + 1);
  final List<String> _taSelection = ['Higher TA', 'Other City', 'No TA'];
  int? _selectedLevel;
  final _basicPayController = TextEditingController();
  final _daController = TextEditingController();
  final _hraController = TextEditingController();
  String? _taSelected;

  final gapWidget = const SizedBox(
    height: 20,
  );

  void _onSubmitForm() {
    final basicPay = int.tryParse(_basicPayController.text);
    final da = int.tryParse(_daController.text);
    final hra = int.tryParse(_hraController.text);

    final basicPayIsInvalid = basicPay == null || basicPay == 0 || basicPay < 0;
    final daIsInvalid = da == null || da < 0 || da > 100;
    final hraIsInvalid = hra == null || hra < 0 || hra > 100;

    if (_selectedLevel == null ||
        basicPayIsInvalid ||
        daIsInvalid ||
        hraIsInvalid ||
        _taSelected == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please make sure that valid input has been entered in all the form fields.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }
    widget.calculateSalary(
      level: _selectedLevel!,
      basicPay: basicPay,
      hra: hra,
      da: da,
      ta: _taSelected!,
    );
  }

  @override
  void dispose() {
    _basicPayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'ENTER DETAILS',
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            gapWidget,
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
              onChanged: (level) {
                _selectedLevel = level;
              },
            ),
            gapWidget,
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _basicPayController,
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
            gapWidget,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _daController,
                    decoration: InputDecoration(
                      labelText: 'DA (in %)',
                      hintText: "46",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
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
                    controller: _hraController,
                    decoration: InputDecoration(
                      labelText: 'HRA (in %)',
                      hintText: "27",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
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
            gapWidget,
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
              onChanged: (taType) {
                _taSelected = taType as String;
              },
            ),
            gapWidget,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: _onSubmitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.cyan, Colors.green],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: 120,
                      height: 40,
                      alignment: Alignment.center,
                      child: const Text(
                        style: TextStyle(color: Colors.white),
                        'Calculate',
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
