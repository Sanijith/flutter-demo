import 'package:fleetride/Repair/repair_name_list.dart';
import 'package:fleetride/trip_community/event_detail.dart';
import 'package:fleetride/trip_community/facility_detail.dart';
import 'package:fleetride/trip_community/facility_profile.dart';
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
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const FacilityProfile()));
            }, icon: const Icon(Icons.person)),
          ],
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg image.jpeg'),
                  fit: BoxFit.fill
              )
          ),
          child: ListView(
            primary: true,
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
            children: [
              Container(
                height: 150,
                padding: const EdgeInsets.all(50),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const FacilityDetail()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),child: const Text('Trip Facility'),
                ),
              ),
              Container(
                height: 150,
                padding: const EdgeInsets.all(50),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetail()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),child: const Text('Events'),
                ),
              ),
            ],
          ),
        )
    );
  }
}
