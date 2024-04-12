import 'package:fleetride/trip_community/event_detail.dart';
import 'package:fleetride/trip_community/facility_detail.dart';
import 'package:fleetride/trip_community/facility_profile.dart';
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
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.jpeg'),
                  fit: BoxFit.fill
              )
          ),
          child: ListView(
            primary: true,
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const FacilityDetail()));
                }, child: const Card(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.add_business_outlined,size: 40),
                    ),
                    SizedBox(width: 30,),
                    Text('Add Facility')
                  ],
                ),
              ),
              ),
              const SizedBox(height: 40,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const EventDetail()));
                }, child: const Card(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.event,size: 40),
                    ),
                    SizedBox(width: 30,),
                    Text('Add Events')
                  ],
                ),
              ),
              ),
            ],
          ),
        )
    );
  }
}
