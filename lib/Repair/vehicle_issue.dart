import 'package:fleetride/Repair/repair_home.dart';
import 'package:flutter/material.dart';

class VehicleIssue extends StatefulWidget {
  const VehicleIssue({super.key});

  @override
  State<VehicleIssue> createState() => _VehicleIssueState();
}

class _VehicleIssueState extends State<VehicleIssue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const RepairHome()));
          }, icon: const Icon(Icons.home)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('Vehicle Issue $index'),
                  subtitle:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Vehicle No:'),
                      SizedBox(width:MediaQuery.of(context).size.width*.030),
                      Text('Driver Name:'),
                      SizedBox(width: MediaQuery.of(context).size.width*.030),
                      Text('Phone Number'),
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
