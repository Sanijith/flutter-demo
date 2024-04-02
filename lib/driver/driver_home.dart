
import 'package:fleetride/driver/delivery_decision.dart';
import 'package:fleetride/driver/driver_report.dart';
import 'package:fleetride/driver/trip_create.dart';
import 'package:fleetride/driver/trip_request_decision.dart';
import 'package:fleetride/user/delivery_request.dart';
import 'package:fleetride/user/profile.dart';
import 'package:fleetride/user/track_ride.dart';
import 'package:fleetride/user/trip_request.dart';
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
          IconButton(onPressed: (){
            Navigator.push((context), MaterialPageRoute(builder: (context)=>const Profile()));
          }, icon: const Icon(Icons.person)),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body:  Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg image.jpeg'),
              fit: BoxFit.fill,
            )
        ),
        child: ListView(
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
          children: [
            Container(
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateTrip( )));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),child: const Text('Set Routes/Trip'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserTripRequest()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),child: const Text('Trip Request'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push((context), MaterialPageRoute(builder: (context)=>const DeliveryDecision()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),child: const Text('Delivery Request'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const DriverReport()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),child: const Text('Report Vehicle Issues'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
