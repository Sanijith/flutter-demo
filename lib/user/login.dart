import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleetride/user/register.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  String id = '';
  String name = '';
  String phone = '';

  void USERLogin() async {
    final user = await FirebaseFirestore.instance
        .collection('UserRegister')
        .where('Email', isEqualTo: email.text)
        .where('Password', isEqualTo: password.text)
        // .where('status', isEqualTo: 1)
        .get();
    if (user.docs.isNotEmpty) {
      id = user.docs[0].id;
      name = user.docs[0]["Username"];
      phone = user.docs[0]["Phone Number"];

      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('id', id);
      data.setString('name', name);
      data.setString('phone', phone);

      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Userhome();
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

  GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String userId = userCredential.user!.uid;
        prefs.setString('userId', userId);

        String name = userCredential.user!.displayName ?? "";
        String email = userCredential.user!.email ?? "";

        String imageUrl = userCredential.user!.photoURL ?? "";

        await FirebaseFirestore.instance.collection('Guser').doc(userId).set({
          'name': name,
          'email': email,
          'imageUrl': imageUrl,
          'userId': userId,
          'phonenumber': null,
          'pincode': null,
          'address': null,
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Userhome(),
          ),
        );
      }
    } catch (error) {
      print("Google sign-in error: $error");
    }
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
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    validator: (value) {
                      if (value!.isEmpty) {
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
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
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
                  SizedBox(height: 20),
                  InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          USERLogin();
                        }
                      },
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
                          ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Dont have an account?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()));
                          },
                          child: const Text('SignUp')),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _signInWithGoogle();
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.g_mobiledata_rounded),
                          SizedBox(width: 5,),
                          Text("Google"),
                        ],
                      )),
                  SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.facebook_outlined),
                          SizedBox(width: 5,),
                          Text("FaceBook"),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
