import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/trip_community/edit_facility_detail.dart';
import 'package:fleetride/trip_community/trip_comm_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_facility_detail.dart';

class FacilityDetail extends StatefulWidget {
  const FacilityDetail({super.key});

  @override
  State<FacilityDetail> createState() => _FacilityDetailState();
}

class _FacilityDetailState extends State<FacilityDetail> {

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
                          builder: (context) => const TripHomeScreen()));
                },
                icon: const Icon(Icons.home_outlined)),
          ],
        ),
        backgroundColor: Colors.white,
        body:
          Column(
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
                        "Facility ",
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
            SizedBox(height:20),
            Expanded(
              child: FutureBuilder(
                  future:
                      FirebaseFirestore.instance.collection("FacilityDetail").get(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error:${snapshot.error}"),
                      );
                    }
                    final facility = snapshot.data?.docs ?? [];
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.red.shade50,
                            child: ListTile(
                              title: Text(facility[index]["Facility Name"]),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditFacilityPage(id:facility[index].id)));
                                      },
                                      icon: Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                        FirebaseFirestore.instance
                                            .collection("FacilityDetail")
                                            .doc(facility[index].id)
                                            .delete();
                                        });
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(facility[index]["Location"]),
                                  Text(facility[index]["Fee"]),
                                  Text(facility[index]["Phone Number"])
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: facility.length);
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddFacilityPage()));
          },
          child: const Icon(Icons.add),
        ));
  }
}


