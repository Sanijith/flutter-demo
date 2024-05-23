import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTrip extends StatefulWidget {
  const MyTrip({super.key});

  @override
  State<MyTrip> createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> {
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
        title: const Text('FLEETRIDE'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DriverHome()));
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("Create Trips")
              .where("Driver Id", isEqualTo: ID)
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
            final mytrips = snapshot.data?.docs ?? [];
            return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.red.shade50,
                    child: ListTile(
                      title: Text('Trip $index'),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              FirebaseFirestore.instance
                                  .collection("Create Trips")
                                  .doc(mytrips[index].id)
                                  .delete();
                            });
                          },
                          icon: Icon(Icons.delete_outline)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('From:'),
                              Text(mytrips[index]["From"])
                            ],
                          ),
                          Row(
                            children: [Text('To:'), Text(mytrips[index]["To"])],
                          )
                        ],
                      ),
                    ),
                  );
                },
                // separatorBuilder: (context, index) {
                //   return const Divider();
                // },
                itemCount: mytrips.length);
          }),
    );
  }
}
