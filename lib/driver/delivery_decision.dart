import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryDecision extends StatefulWidget {
  const DeliveryDecision({super.key});

  @override
  State<DeliveryDecision> createState() => _DeliveryDecisionState();
}

class _DeliveryDecisionState extends State<DeliveryDecision> {
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
                    (context),
                    MaterialPageRoute(
                        builder: (context) => const DriverHome()));
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
                      "Delivery Requests ",
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
                    .collection("Request List")
                    .where("Type Request", isEqualTo: "Delivery Request")
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
                            title: Text('User Request $index'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('User Name:'),
                                    Text(trip[index]["User Name"])
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Phone Number:'),
                                    Text(trip[index]["Phone Number"])
                                  ],
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          FirebaseFirestore.instance
                                              .collection("Request List")
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
                                              .collection("Request List")
                                              .doc(trip[index].id)
                                              .delete();
                                        });
                                      },
                                      child: const Text('Reject'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                    ),
                                  ],
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
    );
  }
}
