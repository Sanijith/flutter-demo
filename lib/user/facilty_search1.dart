import 'package:fleetride/trip_community/trip_comm_home.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';

class FacilitySearch1 extends StatefulWidget {
  const FacilitySearch1({super.key});

  @override
  State<FacilitySearch1> createState() => _FacilitySearch1State();
}

class _FacilitySearch1State extends State<FacilitySearch1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Userhome()));
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('Facility $index'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' Location:'),
                      SizedBox(width: 30),
                      Text('Reg Fee:'),
                      SizedBox(width: 30),
                      Text('Phone Number:')
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 5),
      ),
    );
  }
}
