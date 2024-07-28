import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/Repair/repair_home.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDecision extends StatefulWidget {
  const BookDecision({super.key});

  @override
  State<BookDecision> createState() => _BookDecisionState();
}

class _BookDecisionState extends State<BookDecision> {
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
                        "Schedule",
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
                    final trip = snapshot.data?.docs ?? [];
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text('User Request $index',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Driver Name: ${trip[index]["Driver Name"]}"),
                                  Text("Phone Number: ${trip[index]["Driver Phone Number"]}"),
                                  Text("Vehicle Name: ${trip[index]["Vehicle Name"]}"),
                                  Text("Vehicle Number: ${trip[index]["Vehicle Number"]}"),
                                  Text("Service Item: ${trip[index]["Service Item"]}"),
                                  trip[index]["Status"] == "0"
                                      ? Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            FirebaseFirestore.instance
                                                .collection("Report Issues")
                                                .doc(trip[index].id)
                                                .update({
                                              'Status': "1"
                                            }); // Update the 'Status' field to 1
                                          });
                                          print("object");
                                        },
                                        child: const Text('Accept'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                          Colors.lightGreenAccent,
                                        ),
                                      ),
                                      SizedBox(width: 30),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            FirebaseFirestore.instance
                                                .collection("Report Issues")
                                                .doc(trip[index].id)
                                                .update({
                                              'Status': "2"
                                            }); // Update the 'Status' field to 1
                                          });
                                        },
                                        child: const Text('Reject'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                        ),
                                      ),
                                    ],
                                  )
                                      : trip[index]["Status"] == "1"
                                      ? ElevatedButton(
                                    onPressed: () {
                                      print("object");
                                    },
                                    child: const Text('Accepted'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.lightGreenAccent,
                                    ),
                                  )
                                      : ElevatedButton(
                                    onPressed: () {
                                      print("object");
                                    },
                                    child: const Text('Rejected'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: trip.length);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
