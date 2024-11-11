import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverManage extends StatefulWidget {
  const DriverManage({super.key});

  @override
  State<DriverManage> createState() => _DriverManageState();
}

class _DriverManageState extends State<DriverManage> {
  void _showLicensePhoto(String licensePhotoUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "License Photo",
                  style: GoogleFonts.ubuntu(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.network(
                    licensePhotoUrl,
                    height: 300,
                    width: 300,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,),
                ),),
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          children: [
            Center(
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.lightBlueAccent.shade200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Drivers ",
                      style: GoogleFonts.ubuntu(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                future:
                    FirebaseFirestore.instance.collection("DriverRegister").get(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error:${snapshot.error}"),
                    );
                  }
                  final driver = snapshot.data?.docs ?? [];
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.red.shade50,
                          child: ListTile(
                            title: Text(
                              driver[index]["UserName"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            leading: CircleAvatar(
                              child: ClipOval(
                                child: Image.network(
                                  driver[index]["Path"],
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
                                      .collection("DriverRegister")
                                      .doc(driver[index].id)
                                      .delete();
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Email: ${driver[index]["Email"]}"),
                                Text("Phone: ${driver[index]["Phone Number"]}")
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
            ),
          ],
        ),
      ),
    );
  }
}
