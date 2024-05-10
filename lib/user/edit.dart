import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }
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

  DocumentSnapshot? User;

  getFirebase() async {
    User = await FirebaseFirestore.instance
        .collection("UserRegister")
        .doc(ID)
        .get();
  }

  final formKey=GlobalKey<FormState>();
  var name=TextEditingController();
  var email=TextEditingController();
  var phone=TextEditingController();

  Future<dynamic> EditUser() async {
    await FirebaseFirestore.instance.collection("UserRegister").doc(ID).update({
      "Username": name.text,
      "Email": email.text,
      "Phone Number": phone.text,
    });
    print("Edit Successfully");
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent.shade100,
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            padding: EdgeInsets.all(40),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.lightBlueAccent.shade200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Edit Info",
                        style: GoogleFonts.ubuntu(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: InkWell(
                      onTap: _pickImage,
                      child: _imageFile != null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: FileImage(_imageFile!),
                            )
                          : CircleAvatar(
                              radius: 50,
                              child: Icon(Icons.image),
                            )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: name,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Empty Name!";
                      }
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      labelText: "UserName",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Empty Email!";
                      }
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      labelText: "Email",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phone,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Empty Phone Number!";
                      }
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      labelText: "Phone Number",
                    ),
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                    onTap: () {
                      if(formKey.currentState!.validate()) {
                       setState(() {
                         EditUser();
                       });
                      }
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
                            child: Text('Save',
                                style: GoogleFonts.ubuntu(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
