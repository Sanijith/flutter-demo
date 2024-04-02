import 'package:fleetride/Police/police_home.dart';
import 'package:fleetride/Repair/repair_home.dart';
import 'package:fleetride/driver/delivery_decision.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:fleetride/first.dart';
import 'package:fleetride/landing%20pages/screen1.dart';
import 'package:fleetride/trip_community/trip_comm_home.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:PoliceHome(),
    );
  }
}