import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';

class Drivers extends StatefulWidget {
  const Drivers({super.key});

  @override
  State<Drivers> createState() => _DriversState();
}

class _DriversState extends State<Drivers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => const Userhome()));
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future:
          FirebaseFirestore.instance.collection("Create Trips").get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error:${snapshot.error}"),
              );
            }
            final mytrip = snapshot.data?.docs ?? [];
            return  ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.red.shade50,
                    child: ListTile(
                        title: Text(mytrip[index]["Driver Name"]),
                        subtitle:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('From:'),
                                SizedBox(width: 10,),
                                Text(mytrip[index]["From"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text('To:'),
                                SizedBox(width: 10,),
                                Text(mytrip[index]["To"]),
                              ],
                            )
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text(
                                  "Request Sent Successfully",
                                  style: TextStyle(fontSize:15,color: Colors.red),
                                )));
                          },
                          child: const Text('Send Request'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreenAccent,
                          ),
                        )),
                  );
                },
                itemCount: mytrip.length);
          }),
    );
  }
}
