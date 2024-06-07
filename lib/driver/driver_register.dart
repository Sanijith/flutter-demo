
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:fleetride/driver/driver_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverRegister extends StatefulWidget {
  const DriverRegister({super.key});

  @override
  State<DriverRegister> createState() => _DriverRegisterState();
}

class _DriverRegisterState extends State<DriverRegister> {
  final formKey=GlobalKey<FormState>();
  var name=TextEditingController();
  var password=TextEditingController();
  var email=TextEditingController();
  var phone=TextEditingController();
  var license=TextEditingController();

  Future<dynamic>driverreg() async {
    await FirebaseFirestore.instance.collection('DriverRegister').add({
      "UserName":name.text,
      "Password":password.text,
      "Email":email.text,
      "Phone Number":phone.text,
      "License Number":license.text,
      "Path":"1",
    });
    print('Success');
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => DriverLogin()));
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
                  'Register',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
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
                SizedBox(height: 30),
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
                SizedBox(height: 30),
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
                SizedBox(height: 30),
                TextFormField(
                  controller: phone,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Empty Phone Number";
                    }
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
                SizedBox(height: 30),
                TextFormField(
                  controller: license,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Empty License Number";
                    }
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    icon: const Icon(Icons.credit_card),
                    hintText: "License Number",
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                    onTap: () {
                      if(formKey.currentState!.validate()) {
                        driverreg();
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
                                  builder: (context) => const DriverLogin()));
                        },
                        child: const Text('Login')),
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
