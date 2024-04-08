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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg image.jpeg'),
              fit: BoxFit.fill
            )
          ),
          child: ListView(
            primary: true,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const RepairNames()));
                }, child: const Card(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.calendar_month_outlined,size: 40),
                    ),
                    SizedBox(width: 30,),
                    Text('Schedule Repair')
                  ],
                ),
              ),
              ),
              const SizedBox(height: 40,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const VehicleIssue()));
                }, child: const Card(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.remove_red_eye_outlined,size: 40),
                    ),
                    SizedBox(width: 30,),
                    Text('View Vehicle Issues')
                  ],
                ),
              ),
              ),
            ],
          ),
        ));
  }
}
