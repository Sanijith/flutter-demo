import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  adlogin() {
    if (email.text == 'admin@gmail.com' && password.text == '123') {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return AdminHome();
        },
      ));
    }
  }
  final formKey=GlobalKey<FormState>();
  var email =TextEditingController();
  var password=TextEditingController();
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
                        adlogin();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
