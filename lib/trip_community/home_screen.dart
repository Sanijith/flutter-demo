import 'package:fleetride/user/delivery_request.dart';
import 'package:fleetride/user/profile.dart';
import 'package:fleetride/user/track_ride.dart';
import 'package:fleetride/user/trip_request.dart';
import 'package:flutter/material.dart';

class TripHomeScreen extends StatefulWidget {
  const TripHomeScreen({super.key});

  @override
  State<TripHomeScreen> createState() => _TripHomeScreenState();
}

class _TripHomeScreenState extends State<TripHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FleetRide'),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.person)),
          ],
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
            primary: true,
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
            children: [
              Container(
                padding: const EdgeInsets.all(50),
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),child: const Text('Trip Facility'),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(50),
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),child: const Text('Events'),
                ),
              ),
            ],
          ),
        )
    );
  }
}
