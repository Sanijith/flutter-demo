import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:fleetride/driver/my_trip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateTrip extends StatefulWidget {
  const CreateTrip({super.key});

  @override
  State<CreateTrip> createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  final formKey = GlobalKey<FormState>();
  var from = TextEditingController();
  var to = TextEditingController();

  void initState() {
    super.initState();
    getData();
  }

  var ID;
  var name;
  var phone;

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString('id');
      name=spref.getString('name');
      phone=spref.getString('phone');

    });
    print('Shared Preference data get');
  }

  Future<dynamic> Create() async {
    await FirebaseFirestore.instance.collection("Create Trips").add({
      "Driver Id":ID,
      "Driver Name":name,
      "Driver Phone":phone,
      "From": from.text,
      "To": to.text,
    });
    print('done');
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyTrip()));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FleetRide'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DriverHome()),
                );
              },
              icon: const Icon(Icons.home_outlined),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
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
                        "Create Trip",
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
                    controller: from,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Empty!";
                      }
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelText: "From",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: to,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Empty!";
                      }
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelText: "To",
                    ),
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Create();
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
                            child: Text('Create Trip',
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
