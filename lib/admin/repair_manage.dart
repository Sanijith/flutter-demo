import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';

class RepairManage extends StatefulWidget {
  const RepairManage({super.key});

  @override
  State<RepairManage> createState() => _RepairManageState();
}

class _RepairManageState extends State<RepairManage> {
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
        future: FirebaseFirestore.instance.collection("RepairList").get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final repair =snapshot.data?.docs ?? [];
          return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.red.shade50,
                  child: ListTile(
                    title: Text(repair[index]["Repair Name"]),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.delete)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(repair[index]["Location"]),
                        Text(repair[index]["Phone Number"])
                      ],
                    ),
                  ),
                );
              },
              // separatorBuilder: (context, index) {
              //   return const Divider();
              // },
              itemCount: repair.length);
        },
      ),
    );
  }
}
