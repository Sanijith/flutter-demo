import 'package:fleetride/driver/driver_home.dart';
import 'package:flutter/material.dart';

class DriverReport extends StatefulWidget {
  const DriverReport({super.key});

  @override
  State<DriverReport> createState() => _DriverReportState();
}

class _DriverReportState extends State<DriverReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLEETRIDE'),
        backgroundColor: Colors.white,
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverHome()));
        }, icon: Icon(Icons.home))],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: "Driver Name",
              ),
            ),
            const SizedBox(height: 30,),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: "Vehicle No",
              ),
            ),
            const SizedBox(height: 30,),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: "Vehicle Issue",
              ),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent,
              ), child: const Text('Report'),),
          ],
        ),
      ),
    );
  }
}

