import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/Repair/repair_home.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleList extends StatefulWidget {
  const ScheduleList({super.key});

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  var Name;
  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      Name = spref.getString('rname');
    });
    print('Shared Prefernce data get');
  }

  DocumentSnapshot? Repair;

  getFirebase() async {
    Repair = await FirebaseFirestore.instance
        .collection("RepairRegister")
        .doc(Name)
        .get();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('FleetRide'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => const RepairHome()));
                },
                icon: const Icon(Icons.home)),
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.lightBlueAccent.shade200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        "Schedule List",
                        style: GoogleFonts.ubuntu(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection("Report Issues").where("Repair Name",isEqualTo: Name)
                      .get(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error:${snapshot.error}"),
                      );
                    }
                    final report = snapshot.data?.docs ?? [];
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text('User Report $index',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),),
                              trailing: IconButton(
                                  onPressed: () async {
                                    try {
                                      // Attempt to launch the telephone call
                                      await launch(
                                          'tel:${report[index]["Driver Phone Number"]}');
                                    } catch (e) {
                                      // Handle any exceptions
                                      print(
                                          'Error launching telephone call: $e');
                                      // Display a friendly error message to the user
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Failed to launch phone call. Please check your device settings.'),
                                        ),
                                      );
                                    }
                                  },
                                  icon: Icon(Icons.call_outlined)),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("User Name: ${report[index]["Driver Name"]}"),
                                  Text("Phone Number: ${report[index]["Driver Phone Number"]}"),
                                  Text("Vehicle Number: ${report[index]["Vehicle Number"]}"),
                                  Text("Vehicle Issue: ${report[index]["Vehicle Issue"]}"),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: report.length);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
