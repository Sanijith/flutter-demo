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
            IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          ],
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
            primary: true,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            children: [
              Container(
                padding: const EdgeInsets.all(50),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('Trip Facility'),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(50),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('Events'),
                ),
              ),
            ],
          ),
        ));
  }
}
