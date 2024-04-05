import 'package:fleetride/trip_community/trip_comm_home.dart';
import 'package:fleetride/trip_community/trip_login.dart';
import 'package:fleetride/user/login.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';

class TripRegister extends StatefulWidget {
  const TripRegister({super.key});

  @override
  State<TripRegister> createState() => _TripRegisterState();
}

class _TripRegisterState extends State<TripRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg image.jpeg'),
              fit: BoxFit.fill
            )
          ),
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Register',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  icon: Icon(Icons.person),
                  labelText: "Username",
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  icon: const Icon(Icons.lock),
                  labelText: "Password",
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  icon: const Icon(Icons.email),
                  labelText: "Email",
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  icon: const Icon(Icons.phone),
                  labelText: "Phone Number",
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> TripHomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                ),
                child: const Text('Register'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TripLogin()));
                      },
                      child: const Text('Login')),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
