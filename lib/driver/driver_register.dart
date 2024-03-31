import 'package:fleetride/driver/driver_home.dart';
import 'package:fleetride/login.dart';
import 'package:flutter/material.dart';

class DriverRegister extends StatefulWidget {
  const DriverRegister({super.key});

  @override
  State<DriverRegister> createState() => _DriverRegisterState();
}

class _DriverRegisterState extends State<DriverRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg image.jpeg'),
                fit: BoxFit.fill,
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
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  icon: const Icon(Icons.credit_card),
                  labelText: "License Number",
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const DriverHome()));
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
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
