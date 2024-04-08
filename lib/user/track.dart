import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';

class Track extends StatefulWidget {
  const Track({super.key});

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLEETRIDE'),
        actions: [IconButton(onPressed: () {
          Navigator.push((context), MaterialPageRoute(builder: (context)=>const Userhome()));
        }, icon: const Icon(Icons.home))],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 600,
          height: 600,
          color: Colors.white,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Track Ride',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Track Id',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(Icons.person),
                  Text(
                    'Driver Name',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(Icons.phone  ),
                  Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height:30),
              Row(
                children: [
                  Icon(Icons.start_outlined),
                  Text(
                    'From',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(Icons.location_pin),
                  Text(
                    'To',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text(
                    'Current Location',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
