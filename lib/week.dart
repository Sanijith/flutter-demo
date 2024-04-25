import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayPicker extends StatefulWidget {
  @override
  _DayPickerState createState() => _DayPickerState();
}

class _DayPickerState extends State<DayPicker> {
  final List<bool> _isSelected =
      List.generate(6, (_) => false); // Initially all unchecked

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Days'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(80),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < days.length; i++)
                  Card(
                    color: Colors.red.shade50,
                    child: CheckboxListTile(
                      title: Text(days[i]), // Label for each day
                      value: _isSelected[i],
                      onChanged: (val) => setState(() =>
                          _isSelected[i] = val!), // Update state on change
                    ),
                  ),
                SizedBox(height: 40),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                          height: 53,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          child: Center(
                            child: Text('Save',
                                style: GoogleFonts.ubuntu(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<String> days = [
  'MON',
  'TUE',
  'WED',
  'THU',
  'FRI',
  'SAT',
];
