import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:flutter/material.dart';

class UserTripRequest extends StatefulWidget {
  const UserTripRequest({super.key});

  @override
  State<UserTripRequest> createState() => _UserTripRequestState();
}

class _UserTripRequestState extends State<UserTripRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
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
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("Request List").get(),
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
                                onPressed: () {},
                                child: const Text('Accept'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreenAccent,
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
    );
  }
}
