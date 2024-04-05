import 'package:fleetride/Repair/repair_name_list.dart';
import 'package:fleetride/Repair/repair_profile.dart';
import 'package:fleetride/Repair/vehicle_issue.dart';
import 'package:flutter/material.dart';

class RepairHome extends StatefulWidget {
  const RepairHome({super.key});

  @override
  State<RepairHome> createState() => _RepairHomeState();
}

class _RepairHomeState extends State<RepairHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FleetRide'),
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const RepairProfile()));
            }, icon: const Icon(Icons.person)),
          ],
        ),
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
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            children: [
              Container(
                height: 150,
                padding: const EdgeInsets.all(50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Schedule()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text('Schedule Repair'),
                ),
              ),
              Container(
                height: 150,
                padding: const EdgeInsets.all(50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const VehicleIssue()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text('View Vehicle Issues'),
                ),
              ),
            ],
          ),
        ));
  }
}
