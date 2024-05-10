import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';

class CommunityManage extends StatefulWidget {
  const CommunityManage({super.key});

  @override
  State<CommunityManage> createState() => _CommunityManageState();
}

class _CommunityManageState extends State<CommunityManage> {
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
        future: FirebaseFirestore.instance.collection("CommunityRegister").get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final community =snapshot.data?.docs ?? [];
          return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.red.shade50,
                  child: ListTile(
                    title: Text(community[index]["UserName"]),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            FirebaseFirestore.instance
                                .collection("CommunityRegister")
                                .doc(community[index].id)
                                .delete();
                          });
                        }, icon: const Icon(Icons.delete)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(community[index]["Email"]),
                        Text(community[index]["Phone Number"])
                      ],
                    ),
                  ),
                );
              },
              // separatorBuilder: (context, index) {
              //   return const Divider();
              // },
              itemCount: community.length);
        },
      ),
    );
  }
}
