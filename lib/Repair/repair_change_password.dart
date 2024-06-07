import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/Repair/repair_login.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class RepairChangePassword extends StatefulWidget {
  const RepairChangePassword({super.key, required this.email});
  final email;

  @override
  State<RepairChangePassword> createState() => _RepairChangePasswordState();
}

class _RepairChangePasswordState extends State<RepairChangePassword> {
  final formKey = GlobalKey<FormState>();
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FleetRide'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Userhome()),
                );
              },
              icon: const Icon(Icons.home_outlined),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.all(40),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.lightBlueAccent.shade200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Change Password",
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
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: newPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Password!";
                    }
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: "New Password",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: confirmPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Password!";
                    }
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: "Confirm Password",
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                  onTap: () async {
                    if (newPassword.text == confirmPassword.text) {
                      print('equal');
                      QuerySnapshot querySnapshot = await FirebaseFirestore
                          .instance
                          .collection('UserRegister')
                          .where('Email', isEqualTo: widget.email)
                          .get();

                      if (querySnapshot.docs.isNotEmpty) {
                        DocumentReference userDocRef =
                            querySnapshot.docs.first.reference;
                        await userDocRef.update({
                          'Password': newPassword.text,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Password updated",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        );

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RepairLogin(),
                          ),
                        );
                      } else {
                        print('No user found with the provided email.');
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Passwords don't match",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                      print('not equal');
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
    );
  }
}
