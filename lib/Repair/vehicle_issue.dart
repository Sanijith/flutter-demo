import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/Repair/repair_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleIssue extends StatefulWidget {
  const VehicleIssue({super.key});

  @override
  State<VehicleIssue> createState() => _VehicleIssueState();
}

class _VehicleIssueState extends State<VehicleIssue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FleetRide'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RepairHome()));
              },
              icon: const Icon(Icons.home_outlined)),
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
                      "Vehicle Issues ",
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
                future: FirebaseFirestore.instance
                    .collection("Report Issues")
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
                  final issue = snapshot.data?.docs ?? [];
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.red.shade50,
                          child: ListTile(
                            title: Text('Vehicle Issue $index'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Vehicle No:"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(issue[index]["Vehicle Number"]),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Driver Name:"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(issue[index]["Driver Name"]),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Vehicle Issue:"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(issue[index]["Vehicle Issue"]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: issue.length);
                }),
          ),
        ],
      ),
    );
  }
}
