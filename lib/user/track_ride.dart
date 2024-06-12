import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/user/track.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackRide extends StatefulWidget {
  const TrackRide({super.key});

  @override
  State<TrackRide> createState() => _TrackRideState();
}

class _TrackRideState extends State<TrackRide> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.0, color: Colors.blue), // Change indicator color and width
                  insets: EdgeInsets.symmetric(horizontal: 40.0), // Adjust the insets
                ),
                labelColor: Colors.blue, // Change the label color
                unselectedLabelColor: Colors.black, // Change the unselected label color
                labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), // Change the label text style
                unselectedLabelStyle: TextStyle(fontSize: 14.0), // Change the unselected label text style
                indicatorSize: TabBarIndicatorSize.tab, // Set indicator size to match label size
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20.0), // Adjust indicator padding
                indicatorWeight: 4.0, // Adjust indicator thickness
                indicatorColor: Colors.blue, // Change indicator color
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
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                              title: Text("Trip Request $index",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Track(id: request[index].id),
                                    ),
                                  );
                                },
                                child: Text("Track"),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Driver Name: ${request[index]["Driver Name"]}"),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: request.length,
                      );
                    },
                  ),
                ),
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
                              title: Text("Delivery Request$index",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Track(id: request[index].id),
                                    ),
                                  );
                                },
                                child: Text("Track"),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Driver Name: ${request[index]["Driver Name"]}"),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: request.length,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
