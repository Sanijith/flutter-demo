import 'package:fleetride/user/delivery_request.dart';
import 'package:fleetride/user/facilty_search1.dart';
import 'package:fleetride/user/help_line.dart';
import 'package:fleetride/user/profile.dart';
import 'package:fleetride/user/track_ride.dart';
import 'package:fleetride/user/trip_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Userhome extends StatefulWidget {
  const Userhome({super.key});

  @override
  State<Userhome> createState() => _UserhomeState();
}

class _UserhomeState extends State<Userhome> {
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
          backgroundColor: Colors.white,
        ),
        body:  Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpeg'),
                fit: BoxFit.fill,
              )
          ),
          child: ListView(
              primary: false,
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const TripRequest()));
                  }, child: const Card(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(CupertinoIcons.car_detailed,size: 40),
                      ),
                      SizedBox(width: 30,),
                      Text('Trip Request')
                    ],
                  ),
                ),
                ),
                const SizedBox(height: 40,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const TrackRide()));
                  }, child: const Card(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.route_outlined,size: 40),
                      ),
                      SizedBox(width: 30,),
                      Text('Track Ride')
                    ],
                  ),
                ),
                ),
                const SizedBox(height: 40,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const DeliveryRequest()));
                  }, child: const Card(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.delivery_dining_outlined,size: 40),
                      ),
                      SizedBox(width: 30,),
                      Text('Delivery Request')
                    ],
                  ),
                ),
                ),
                const SizedBox(height: 40,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const FacilitySearch1()));
                  }, child: const Card(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.search,size: 40),
                      ),
                      SizedBox(width: 30,),
                      Text('Facility Search')
                    ],
                  ),
                ),
                ),
                const SizedBox(height: 40,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HelpLine()));
                  }, child: const Card(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.help_outline,size: 40),
                      ),
                      SizedBox(width: 30,),
                      Text('HelpLine')
                    ],
                  ),
                ),
                )
              ],
            ),
        ),
    );
  }
}
