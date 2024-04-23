import 'package:fleetride/Repair/repair_name_list.dart';
import 'package:fleetride/Repair/repair_profile.dart';
import 'package:fleetride/Repair/vehicle_issue.dart';
import 'package:fleetride/user/delivery_request.dart';
import 'package:fleetride/user/facilty_search1.dart';
import 'package:fleetride/user/help_line.dart';
import 'package:fleetride/user/profile.dart';
import 'package:fleetride/user/track_ride.dart';
import 'package:fleetride/user/trip_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RepairHome extends StatefulWidget {
  const RepairHome({Key? key}) : super(key: key);

  @override
  State<RepairHome> createState() => _RepairHomeState();
}

class _RepairHomeState extends State<RepairHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FleetRide'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RepairProfile()),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 40,
          crossAxisSpacing: 40,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RepairNames()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.schedule_outlined, size: 40),
                    ),
                    const SizedBox(height: 10),
                    Text('Schedule Repair', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VehicleIssue()),
                );
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.report_outlined, size: 40),
                    ),
                    const SizedBox(height: 10),
                    Text('Vehicle Issues', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),          ],
        ),
      ),
    );
  }
}
