import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/Repair/repair_home.dart';
import 'package:flutter/material.dart';

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
        title: const Text('FLEETRIDE'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RepairHome()));
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("DriverRegister").get(),
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
                              Text(issue[index]["Vehicle Number"]),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Driver Name:"),
                              Text(issue[index]["Driver Name"]),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Vehicle Issue"),
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
    );
  }
}
