import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/trip_community/edit_event_detail.dart';
import 'package:fleetride/trip_community/trip_comm_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_event_detail.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({super.key});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {

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
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TripHomeScreen()));
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("EventDetail").get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error:${snapshot.error}"),
              );
            }
            final event = snapshot.data?.docs ?? [];
            return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.red.shade50,
                    child: ListTile(
                      title: Text(event[index]["Event Name"]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditEventPage(id:event[index].id)));
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(onPressed: () {
                            setState(() {
                              FirebaseFirestore.instance
                                  .collection("EventDetail")
                                  .doc(event[index].id)
                                  .delete();
                            });
                          }, icon: Icon(Icons.delete))
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(event[index]["Location"]),
                          Text(event[index]["Time"]),
                          Text(event[index]["Phone Number"])
                        ],
                      ),
                    ),
                  );
                },
                itemCount: event.length);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddEventPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

