import 'package:fleetride/Police/police_home.dart';
import 'package:flutter/material.dart';

class DriverDetail1 extends StatefulWidget {
  const DriverDetail1({super.key});

  @override
  State<DriverDetail1> createState() => _DriverDetail1State();
}

class _DriverDetail1State extends State<DriverDetail1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLEETRIDE'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const PoliceHome()));
          }, icon: const Icon(Icons.home))
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              color: Colors.grey,
              child: Column(
                children: [
                  const Text('Section',style: TextStyle(fontSize: 30),),
                  const Text('Topic'),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Fine'),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Details'),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
