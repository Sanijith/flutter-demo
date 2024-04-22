
import 'package:fleetride/first.dart';
import 'package:fleetride/user/edit.dart';
import 'package:fleetride/user/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Colors.lightBlueAccent.shade100,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.lightBlueAccent.shade200
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child:
                          Text(
                            "Track ",
                            style: GoogleFonts.ubuntu(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: Card(
                  color: Colors.red.shade50,
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.confirmation_number_outlined),
                    trailing: Text(
                      "12312213",
                      style: TextStyle(
                          fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.red.shade50,
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Text(
                      "Driver Name",
                      style: TextStyle(
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.red.shade50,
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    trailing: Text(
                      "+91 1234567890",
                      style: TextStyle(
                          fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.red.shade50,
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.start),
                    trailing: Text(
                      "From",
                      style: TextStyle(
                          fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.red.shade50,
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.location_on_outlined),
                    trailing: Text(
                      "To",
                      style: TextStyle(
                          fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.red.shade50,
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.my_location),
                    trailing: Text(
                      "Current Location",
                      style: TextStyle(
                          fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
