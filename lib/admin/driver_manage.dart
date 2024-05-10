import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';

class DriverManage extends StatefulWidget {
  const DriverManage({super.key});

  @override
  State<DriverManage> createState() => _DriverManageState();
}

class _DriverManageState extends State<DriverManage> {
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
        future: FirebaseFirestore.instance.collection("DriverRegister").get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final driver =snapshot.data?.docs ?? [];
          return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.red.shade50,
                  child: ListTile(
                    title: Text(driver[index]["UserName"]),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            FirebaseFirestore.instance
                                .collection("DriverRegister")
                                .doc(driver[index].id)
                                .delete();
                          });
                        }, icon: const Icon(Icons.delete)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(driver[index]["Email"]),
                        Text(driver[index]["Phone Number"])
                      ],
                    ),
                  ),
                );
              },
              // separatorBuilder: (context, index) {
              //   return const Divider();
              // },
              itemCount: driver.length);
        },
      ),
    );
  }
}
