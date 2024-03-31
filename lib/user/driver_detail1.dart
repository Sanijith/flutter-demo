import 'package:fleetride/user/user_home.dart';
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Userhome()));
          }, icon: const Icon(Icons.home))
        ],
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.cyan,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              color: Colors.white,
              child: Column(
                children: [
                  const Text('Driver',style: TextStyle(fontSize: 30),),
                  const Text('Trip Id'),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('From'),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('To'),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Trip Request')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
