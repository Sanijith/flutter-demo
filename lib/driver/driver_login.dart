import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:fleetride/driver/driver_register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverLogin extends StatefulWidget {
  const DriverLogin({super.key});

  @override
  State<DriverLogin> createState() => _DriverLoginState();
}

class _DriverLoginState extends State<DriverLogin> {
  final formKey=GlobalKey<FormState>();
  var email=TextEditingController();
  var password=TextEditingController();
  String id='';
  void DRIVERLogin() async {
    final user = await FirebaseFirestore.instance
        .collection('DriverRegister')
        .where('Email', isEqualTo: email.text)
        .where('Password', isEqualTo: password.text)
    // .where('status', isEqualTo: 1)
        .get();
    if (user.docs.isNotEmpty) {
      id = user.docs[0].id;


      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('id', id);


      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return DriverHome();
        },
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "username and password error",
            style: TextStyle(color: Colors.red),
          )));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height*1,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/background.jpeg'),
              fit: BoxFit.fill,
            )),
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: email,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Empty Email";
                    }
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    icon: Icon(Icons.email_outlined),
                    hintText: "Email",
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: password,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Empty Password";
                    }
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    icon: Icon(Icons.lock),
                    hintText: "Password",
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                    onTap: () {
                      if(formKey.currentState!.validate()){
                        DRIVERLogin();
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
                            child: Text('Login',
                                style: GoogleFonts.ubuntu(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DriverRegister()));
                        },
                        child: const Text('SignUp')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
