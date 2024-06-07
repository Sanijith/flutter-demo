import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/user/track.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackRide extends StatefulWidget {
  const TrackRide({super.key});

  @override
  State<TrackRide> createState() => _TrackRideState();
}

class _TrackRideState extends State<TrackRide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2, // number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: const Text('FleetRide'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Userhome()),
                  );
                },
                icon: const Icon(Icons.home_outlined),
              ),
            ],
            backgroundColor: Colors.white,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Trip Requests'),
                Tab(text: 'Delivery Requests'),
              ],
              // Customize the TabBar appearance
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Adjust the shape
                color: Colors.orange, // Change the color
              ),
              labelColor: Colors.white, // Change the label color
            ),
          ),
          body: TabBarView(
            children: [
              // Contents of Tab 1
              Padding(
                  padding: EdgeInsets.all(10),
                  child: FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection("Request List")
                          .where("Status", isEqualTo: "1")
                          .where("Type Request", isEqualTo: "Trip Request")
                          .get(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Error:${snapshot.error}"),
                          );
                        }
                        final request = snapshot.data?.docs ?? [];
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.red.shade50,
                              child: ListTile(
                                title: Text("Trip Request $index"),
                                trailing: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Track(id:request[index].id),
                                      ),
                                    );
                                  },
                                  child: Text("Track"),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Driver Name:'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(request[index]["Driver Name"]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: request.length,
                        );
                      })),
              // Contents of Tab 2
              Padding(
                padding: EdgeInsets.all(10),
                child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection("Request List")
                    .where("Status", isEqualTo: "1")
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
                      final request = snapshot.data?.docs ?? [];
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.red.shade50,
                            child: ListTile(
                              title: Text("Delivery Request"),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Track(id:request[index].id),
                                    ),
                                  );
                                },
                                child: Text("Track"),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Driver Name:'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(request[index]["Driver Name"]),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: request.length,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
