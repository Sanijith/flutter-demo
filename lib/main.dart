import 'package:fleetride/Police/contact_list.dart';
import 'package:fleetride/Police/police_home.dart';
import 'package:fleetride/Police/section_list.dart';
import 'package:fleetride/Repair/repair_home.dart';
import 'package:fleetride/Repair/repair_name_list.dart';
import 'package:fleetride/Repair/repair_profile.dart';
import 'package:fleetride/admin/admin_home.dart';
import 'package:fleetride/admin/contact_manage.dart';
import 'package:fleetride/driver/driver_edit.dart';
import 'package:fleetride/driver/driver_profile.dart';
import 'package:fleetride/driver/driver_report.dart';
import 'package:fleetride/driver/trip_create.dart';
import 'package:fleetride/driver/trip_request_decision.dart';
import 'package:fleetride/first.dart';
import 'package:fleetride/trip_community/event_detail.dart';
import 'package:fleetride/trip_community/facility_detail.dart';
import 'package:fleetride/trip_community/trip_comm_home.dart';
import 'package:fleetride/u.dart';
import 'package:fleetride/user/edit.dart';
import 'package:fleetride/user/help_line.dart';
import 'package:fleetride/user/profile.dart';
import 'package:fleetride/user/track.dart';
import 'package:fleetride/user/track_ride.dart';
import 'package:fleetride/week.dart';
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
      title: 'FleetRide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:FirstPage(),
          );
  }
}