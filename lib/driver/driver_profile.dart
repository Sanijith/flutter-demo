import 'package:fleetride/driver/driver_edit.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:fleetride/login.dart';
import 'package:fleetride/user/edit.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLEETRIDE'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){
            Navigator.push((context), MaterialPageRoute(builder: (context)=>const DriverHome()));
          }, icon: const Icon(Icons.home)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text('User Id'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail),
                    SizedBox(width: 10),
                    Text('email@gmail.com'),
                    SizedBox(width: 40),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 10),
                  Text('1234567890'),
                  SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                Navigator.push((context),MaterialPageRoute(builder: (context)=>const DriverEdit()));
              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                ), child: const Text('Edit'),),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text('Logout')),
            ],
          )),
    );
  }
}
