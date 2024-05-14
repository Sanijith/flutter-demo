import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';

class TripManage extends StatefulWidget {
  const TripManage({super.key});

  @override
  State<TripManage> createState() => _TripManageState();
}

class _TripManageState extends State<TripManage> {
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
                          builder: (context) => const AdminHome()));
                },
                icon: const Icon(Icons.home))
          ],
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: FirebaseFirestore.instance.collection(" Register").get(),
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
                      color: Colors.red.shade50,
                      child: ListTile(
                        title: Text(trip[index]["UserName"]),
                        trailing: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        subtitle: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('data'),
                          ],
                        ),
                      ),
                    );
                  },
                  // separatorBuilder: (context, index) {
                  //   return const Divider();
                  // },
                  itemCount: trip.length);
            }));
  }
}
