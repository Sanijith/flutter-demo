import 'package:fleetride/driver/delivery_decision.dart';
import 'package:fleetride/driver/driver_report.dart';
import 'package:fleetride/driver/facilty_search2.dart';
import 'package:fleetride/driver/trip_create.dart';
import 'package:fleetride/driver/trip_request_decision.dart';
import 'package:fleetride/user/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DriverHome extends StatefulWidget {
  const DriverHome({super.key});

  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FleetRide'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
              icon: const Icon(Icons.person)),
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/bg image.jpeg'),
          fit: BoxFit.fill,
        )),
        child: ListView(
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateTrip()));
              },
              child: const Card(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.add,size: 40),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Set/Create Trip')
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserTripRequest()));
              },
              child: const Card(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(CupertinoIcons.plus_slash_minus,size: 40),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Trip Requests')
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeliveryDecision()));
              },
              child: const Card(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(CupertinoIcons.plus_slash_minus,size: 40),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Delivery Request')
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DriverReport()));
              },
              child: const Card(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.report_outlined,size: 40),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Report Vehicle Issues')
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FacilitySearch2()));
              },
              child: const Card(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.search,size: 40),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Facility Search')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
