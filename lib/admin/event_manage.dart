import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';

class EventManage extends StatefulWidget {
  const EventManage({super.key});

  @override
  State<EventManage> createState() => _EventManageState();
}

class _EventManageState extends State<EventManage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AdminHome()));
              },
              icon: const Icon(Icons.home))
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("EventDetail").get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final event =snapshot.data?.docs ?? [];
          return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.red.shade50,
                  child: ListTile(
                    title: Text(event[index]["Event Name"]),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            FirebaseFirestore.instance
                                .collection("EventDetail")
                                .doc(event[index].id)
                                .delete();
                          });
                        }, icon: const Icon(Icons.delete)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(event[index]["Location"]),
                        Text(event[index]["Phone Number"]),
                        Text(event[index]["Time"])
                      ],
                    ),
                  ),
                );
              },
              // separatorBuilder: (context, index) {
              //   return const Divider();
              // },
              itemCount: event.length);
        },
      ),
    );
  }
}
