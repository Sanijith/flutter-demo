import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/Repair/repair_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class RepairNamesList extends StatefulWidget {
  const RepairNamesList({super.key});

  @override
  State<RepairNamesList> createState() => _RepairNamesListState();
}

class _RepairNamesListState extends State<RepairNamesList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FleetRide'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RepairHome()),
                );
              },
              icon: const Icon(Icons.home_outlined),
            ),
          ],
          backgroundColor: Colors.white,
        ),
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
                        "Repairs",
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
            SizedBox(height: 20,),
            Expanded(
              child: FutureBuilder(
                  future:
                  FirebaseFirestore.instance.collection("RepairList").get(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error:${snapshot.error}"),
                      );
                    }
                    final repairs = snapshot.data?.docs ?? [];
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.red.shade50,
                            child: ListTile(
                              title: Text(
                                repairs[index]["Repair Name"],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              trailing: IconButton(
                                  onPressed: () async {
                                    try {
                                      // Attempt to launch the telephone call
                                      await launch(
                                          'tel:${repairs[index]["Phone Number"]}');
                                    } catch (e) {
                                      // Handle any exceptions
                                      print('Error launching telephone call: $e');
                                      // Display a friendly error message to the user
                                      ScaffoldMessenger.of(context).showSnackBar(
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Shop Name: ${repairs[index]["Repair Shop Name"]}",
                                      style: TextStyle(fontSize: 14)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Location: ${repairs[index]["Location"]}",
                                      style: TextStyle(fontSize: 14)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Phone Number: ${repairs[index]["Phone Number"]}",
                                      style: TextStyle(fontSize: 14)),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: repairs.length);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
