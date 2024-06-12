import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/Repair/repair_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_repair_detail.dart';

class RepairNames extends StatefulWidget {
  const RepairNames({super.key});

  @override
  State<RepairNames> createState() => _RepairNamesState();
}

class _RepairNamesState extends State<RepairNames> {
  var ID;

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString('id');
    });
    print('Shared Preference data get');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FleetRide'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RepairHome()),
              );
            },
            icon: const Icon(Icons.home_outlined),
          ),
        ],
        backgroundColor: Colors.white,
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
                      "Repairs ",
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
                    .collection("RepairList")
                    .where("Repair Id", isEqualTo: ID)
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
                  final repairs = snapshot.data?.docs ?? [];
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.red.shade50,
                          child: ListTile(
                            title: Text(
                              repairs[index]["Repair Name"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
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
                                Row(
                                  children: [
                                    Text("Location: "),
                                    Text(repairs[index]["Location"]),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text("Phone Number: "),
                                    Text(repairs[index]["Phone Number"]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: repairs.length);
                }),
          ),
        ],
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
