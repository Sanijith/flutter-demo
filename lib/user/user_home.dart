import 'package:fleetride/user/delivery_request.dart';
import 'package:fleetride/user/facilty_search1.dart';
import 'package:fleetride/user/help_line.dart';
import 'package:fleetride/user/profile.dart';
import 'package:fleetride/user/track_ride.dart';
import 'package:fleetride/user/trip_request.dart';
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
                  height: 150,
                  padding: const EdgeInsets.all(50),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const TripRequest()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),child: const Text('Trip Request'),
                  ),
                ),
                Container(
                  height: 150,
                  padding: const EdgeInsets.all(50),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const TrackRide()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),child: const Text('Track Ride'),
                  ),
                ),
                Container(
                  height: 150,
                  padding: const EdgeInsets.all(50),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push((context), MaterialPageRoute(builder: (context)=>const DeliveryRequest()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),child: const Text('Delivery Request'),
                  ),
                ),
                Container(
                  height: 150,
                  padding: const EdgeInsets.all(50),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const FacilitySearch1()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),child: const Text('Facility Search'),
                  ),
                ),
                Container(
                  height: 150,
                  padding: const EdgeInsets.all(50),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpLine()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),child: const Text('HelpLine'),
                  ),
                )
              ],
            ),
        ),
    );
  }
}
