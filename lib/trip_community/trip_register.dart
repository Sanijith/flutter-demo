import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/trip_community/trip_comm_home.dart';
import 'package:fleetride/trip_community/trip_login.dart';
import 'package:fleetride/user/login.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TripRegister extends StatefulWidget {
  const TripRegister({super.key});

  @override
  State<TripRegister> createState() => _TripRegisterState();
}

class _TripRegisterState extends State<TripRegister> {
  final formKey=GlobalKey<FormState>();
  var name = TextEditingController();
  var password = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();

  Future<dynamic> TripReg() async {
    await FirebaseFirestore.instance.collection("CommunityRegister").add({
      "UserName":name.text,
      "Password":password.text,
      "Email":email.text,
      "Phone Number":phone.text,
      "Path":"https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o=",

    });
    print('Success');
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => TripLogin()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background.jpeg'),
                      fit: BoxFit.fill)),
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: name,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Empty Name";
                      }
                    },
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      icon: Icon(Icons.person),
                      hintText: "Username",
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    controller: password,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Empty Password";
                      }
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      icon: const Icon(Icons.lock),
                      hintText: "Password",
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: email,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Empty Email";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      icon: const Icon(Icons.email),
                      hintText: "Email",
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Empty Phone Number!";
                      } else if (value.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return "Invalid Phone Number";
                      }
                      return null; // Valid input
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      icon: const Icon(Icons.phone),
                      hintText: "Phone Number",
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                      onTap: () {
                        if(formKey.currentState!.validate()) {
                          TripReg();
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
                              child: Text('Register',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TripLogin()));
                          },
                          child: const Text('Login')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
