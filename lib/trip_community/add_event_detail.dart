import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/trip_community/event_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final formKey = GlobalKey<FormState>();
  var eventname = TextEditingController();
  var location = TextEditingController();
  var phone = TextEditingController();
  var timeController = TextEditingController();
  String select = '';


  Future<dynamic> Event() async {
    await FirebaseFirestore.instance.collection("EventDetail").add({
      "Event Name": eventname.text,
      "Location": location.text,
      "Time": timeController.text,
      "Phone Number": phone.text,
    });
    print('done');
    Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetail()));

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.lightBlueAccent.shade200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add Event ",
                        style: GoogleFonts.ubuntu(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: eventname,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Empty Name!";
                      }
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelText: "Event Name",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: location,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Empty Location!";
                      }
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelText: "Location",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: timeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Empty Time!";
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: "Time",
                        suffixIcon: TextButton(
                            onPressed: () async {
                              TimeOfDay? timepick = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                initialEntryMode: TimePickerEntryMode.input,
                              );
                              if (timepick != null) {
                                select = '${timepick.format(context)}';
                                timeController.text = select;
                                print(
                                    "time selected:${timepick.hour}:${timepick.minute}");
                              }
                            },
                            child: Icon(Icons.schedule)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Empty Phone Number!";
                      }
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelText: "Phone Number",
                    ),
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Event();
                      }
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
