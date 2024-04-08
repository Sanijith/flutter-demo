import 'package:fleetride/user/track.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackRide extends StatefulWidget {
  const TrackRide({super.key});

  @override
  State<TrackRide> createState() => _TrackRideState();
}

class _TrackRideState extends State<TrackRide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLEETRIDE'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.home))],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
        child: Container(
          padding: const EdgeInsets.all(50),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text('Track Ride',style: GoogleFonts.itim(
                 fontSize:20,
               )),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: "Track Id"),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push((context),MaterialPageRoute(builder: (context)=>const Track()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                ),
                child: const Text('Track Ride'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
