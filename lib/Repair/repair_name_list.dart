import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/Repair/repair_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_repair_detail.dart';

class RepairNames extends StatefulWidget {
  const RepairNames({super.key});

  @override
  State<RepairNames> createState() => _RepairNamesState();
}

class _RepairNamesState extends State<RepairNames> {

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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: FutureBuilder(
            future: FirebaseFirestore.instance.collection("RepairList").get(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error:${snapshot.error}"),
                );
              }
              final repairs = snapshot.data?.docs ?? [];
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.red.shade50,
                      child: ListTile(
                        title: Text(repairs[index]["Repair Name"]),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                FirebaseFirestore.instance
                                    .collection("RepairList")
                                    .doc(repairs[index].id)
                                    .delete();
                              });
                            },
                            icon: Icon(Icons.delete)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(repairs[index]["Location"]),
                            SizedBox(
                              height: 10,
                            ),
                            Text(repairs[index]["Phone Number"]),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: repairs.length);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditRepairPage()));

        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
