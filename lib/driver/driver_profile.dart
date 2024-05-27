import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/driver/driver_change_password.dart';
import 'package:fleetride/driver/driver_edit.dart';
import 'package:fleetride/driver/driver_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverProfile extends StatefulWidget {
  const DriverProfile({super.key});

  @override
  State<DriverProfile> createState() => _DriverProfileState();
}

class _DriverProfileState extends State<DriverProfile> {
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

  DocumentSnapshot? Drivers;

  getFirebase() async {
    Drivers = await FirebaseFirestore.instance
        .collection("DriverRegister")
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
            body: SingleChildScrollView(
              child: Container(
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
                                Drivers!["UserName"],
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
                   SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        color: Colors.red.shade50,
                        elevation: 4,
                        child: ListTile(
                          leading: Icon(Icons.email),
                          trailing: Text(
                            Drivers!["Email"],
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
                            Drivers!["Phone Number"],
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(43, 44, 47, 1)),
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
                          leading: Icon(Icons.credit_card),
                          trailing: Text(
                            Drivers!["License Number"],
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
                                  builder: (context) => DriverChangePassword()));
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
                                      builder: (context) => DriverEdit()));
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
                                      builder: (context) => DriverLogin()));
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
            ),
          );
        });
  }
}
