import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';

class FacilityManage extends StatefulWidget {
  const FacilityManage({super.key});

  @override
  State<FacilityManage> createState() => _FacilityManageState();
}

class _FacilityManageState extends State<FacilityManage> {
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
        future: FirebaseFirestore.instance.collection("FacilityDetail").get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final facility =snapshot.data?.docs ?? [];
          return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.red.shade50,
                  child: ListTile(
                    title: Text(facility[index]["Facility Name"]),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            FirebaseFirestore.instance
                                .collection("FacilityDetail")
                                .doc(facility[index].id)
                                .delete();
                          });
                        }, icon: const Icon(Icons.delete)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(facility[index]["Fee"]),
                        Text(facility[index]["Location"]),
                        Text(facility[index]["Phone Number"])
                      ],
                    ),
                  ),
                );
              },
              // separatorBuilder: (context, index) {
              //   return const Divider();
              // },
              itemCount: facility.length);
        },
      ),
    );
  }
}
