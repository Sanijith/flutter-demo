import 'package:firebase_core/firebase_core.dart';
import 'package:fleetride/Repair/repair_login.dart';
import 'package:fleetride/Repair/repair_register.dart';
import 'package:fleetride/admin/admin_login.dart';
import 'package:fleetride/driver/driver_login.dart';
import 'package:fleetride/driver/driver_register.dart';
import 'package:fleetride/firebase_options.dart';
import 'package:fleetride/first.dart';
import 'package:fleetride/trip_community/facility_detail.dart';
import 'package:fleetride/trip_community/trip_login.dart';
import 'package:fleetride/trip_community/trip_register.dart';
import 'package:fleetride/user/register.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FleetRide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:FirstPage(),
          );
  }
}