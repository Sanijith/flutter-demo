import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: const Text('FleetRide'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AdminHome()));
              },
              icon: const Icon(Icons.home_outlined))
        ],
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
                      "Trip Community ",
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
                  .collection("CommunityRegister")
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
                final community = snapshot.data?.docs ?? [];
                return ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.red.shade50,
                        child: ListTile(
                          title: Text(community[index]["UserName"]),
                          leading: community[index]["Path"] == "1"
                              ? CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/user.jpg",
                                      height: 90,
                                      width: 90,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : CircleAvatar(
                                  child: ClipOval(
                                    child: Image.network(
                                      community[index]["Path"],
                                      height: 90,
                                      width: 90,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  FirebaseFirestore.instance
                                      .collection("CommunityRegister")
                                      .doc(community[index].id)
                                      .delete();
                                });
                              },
                              icon: const Icon(Icons.delete)),
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
          ),
        ],
      ),
    );
  }
}
