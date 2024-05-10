import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/trip_community/trip_change_password.dart';
import 'package:fleetride/trip_community/trip_edit.dart';
import 'package:fleetride/trip_community/trip_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FacilityProfile extends StatefulWidget {
  const FacilityProfile({super.key});

  @override
  State<FacilityProfile> createState() => _FacilityProfileState();
}

class _FacilityProfileState extends State<FacilityProfile> {
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
    print('Shared Prefernce data get');
  }

  DocumentSnapshot? TripCommunity;

  getFirebase() async {
    TripCommunity = await FirebaseFirestore.instance
        .collection("CommunityRegister")
        .doc(ID)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Error${snapshot.error}");
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlueAccent.shade100,
            ),
            body: Container(
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.lightBlueAccent.shade200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 30,
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                ),
                              ),
                            ),
                            Text(
                              TripCommunity!["UserName"],
                              style: GoogleFonts.ubuntu(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      color: Colors.red.shade50,
                      elevation: 4,
                      child: ListTile(
                        leading: Icon(Icons.email),
                        trailing: Text(
                          TripCommunity!["Email"],
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      color: Colors.red.shade50,
                      elevation: 4,
                      child: ListTile(
                        leading: Icon(Icons.phone),
                        trailing: Text(
                          TripCommunity!["Phone Number"],
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(43, 44, 47, 1)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TripChangePassword()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                            height: 53,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                            child: Center(
                              child: Text('Change Password',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FacilityEdit()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                                height: 53,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green),
                                child: Center(
                                  child: Text('Edit',
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )),
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TripLogin()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                                height: 53,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.redAccent),
                                child: Center(
                                  child: Text('Logout',
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
