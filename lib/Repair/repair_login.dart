
import 'package:fleetride/Repair/repair_home.dart';
import 'package:fleetride/Repair/repair_register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RepairLogin extends StatefulWidget {
  const RepairLogin({super.key});

  @override
  State<RepairLogin> createState() => _RepairLoginState();
}

class _RepairLoginState extends State<RepairLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpeg'),
            fit: BoxFit.fill,
          )
        ),
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                icon: Icon(Icons.email_outlined),
                hintText: "Email",
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                icon: Icon(Icons.lock),
                hintText: "Password",
              ),
            ),
            SizedBox(height: 30),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RepairHome()));
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
                const Text('Dont have an accout?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RepairRegister()));
                    },
                    child: const Text('SignUp')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
