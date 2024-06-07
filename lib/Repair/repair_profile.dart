import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/Repair/repair_change_password.dart';
import 'package:fleetride/Repair/repair_edit.dart';
import 'package:fleetride/Repair/repair_home.dart';
import 'package:fleetride/Repair/repair_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class RepairProfile extends StatefulWidget {
  const RepairProfile({super.key});

  @override
  State<RepairProfile> createState() => _RepairProfileState();
}

class _RepairProfileState extends State<RepairProfile> {
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

  DocumentSnapshot? Repair;

  getFirebase() async {
    Repair = await FirebaseFirestore.instance
        .collection("RepairRegister")
        .doc(ID)
        .get();
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Choose from Gallery'),
                onTap: () {
                  // Add functionality to choose from gallery
                  _getImage();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Remove Photo'),
                onTap: () {
                  setState(() {
                    FirebaseFirestore.instance
                        .collection("UserRegister")
                        .doc(ID)
                        .update({
                      "Path" : "1",
                    });

                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  PickedFile? _image;
  Future<void> _getImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = PickedFile(pickedFile.path);
        print("picked image");
        update();
      } else {
        print('No image selected.');
      }
    });
  }
  Future<void> update() async {
    try {
      if (_image != null) {
        final ref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child('repair_images')
            .child(DateTime.now().millisecondsSinceEpoch.toString());
        await ref.putFile(File(_image!.path));

        final imageURL = await ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('RepairRegister')
            .doc(ID)
            .update({
          'Path': imageURL,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No image selected'),
          ),
        );
      }
    } catch (e) {
      print('Error updating profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error updating profile'),
        ),
      );
    }
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
              title: const Text('FleetRide'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RepairHome()),
                    );
                  },
                  icon: const Icon(Icons.home_outlined),
                ),
              ],
              backgroundColor: Colors.white,
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
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child: Stack(
                                children: [
                                  Repair!["Path"] == "1"
                                      ? ClipOval(
                                    child: Image.asset(
                                      "assets/user.jpg",
                                      height: 100,
                                      width: 90,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                      : ClipOval(
                                    child: Image.network(
                                      Repair!["Path"],
                                      height: 90,
                                      width: 90,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: IconButton(onPressed: (){
                                      setState(() {
                                        _showBottomSheet(context);
                                      });
                                    }, icon: Icon(Icons.camera_alt_outlined)),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              Repair!["UserName"],
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
                          Repair!["Email"],
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
                          Repair!["PhoneNumber"],
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
                                builder: (context) => RepairChangePassword(email: Repair!["Email"],)));
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
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RepairEdit()));
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
                                    builder: (context) => RepairLogin()));
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
