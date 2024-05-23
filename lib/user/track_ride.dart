import 'package:fleetride/user/track.dart';
import 'package:flutter/cupertino.dart';
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
      body:DefaultTabController(
      length: 2, // number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Trip Requests'),
              Tab(text: 'Delivery Requests'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Contents of Tab 1
        Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                color: Colors.red.shade50,
                child: ListTile(
                  title: Text("Trip Request $index"),
                  trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Track(),
                            ));
                      },
                      child: Text("Track")),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Driver Name:'),
                          SizedBox(
                            width: 10,
                          ),
                          // Text(event[index]["Location"]),
                        ],
                      ),
                      Row(
                        children: [
                          Text('From:'),
                          SizedBox(
                            width: 10,
                          ),
                          // Text(event[index]["Time"]),
                        ],
                      ),
                      Row(
                        children: [
                          Text('To:'),
                          SizedBox(
                            width: 10,
                          ),
                          // Text(event[index]["Phone Number"]),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: 5),),
            // Contents of Tab 2
        Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.red.shade50,
                  child: ListTile(
                    title: Text("Delivery Request"),
                    trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Track(),
                              ));
                        },
                        child: Text("Track")),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('From:'),
                            SizedBox(
                              width: 10,
                            ),
                            // Text(event[index]["Location"]),
                          ],
                        ),
                        Row(
                          children: [
                            Text('To:'),
                            SizedBox(
                              width: 10,
                            ),
                            // Text(event[index]["Time"]),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Weight:'),
                            SizedBox(
                              width: 10,
                            ),
                            // Text(event[index]["Phone Number"]),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: 5)),
          ],
        ),
      ),
    ),
    );
  }
}
