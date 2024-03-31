import 'package:flutter/material.dart';

class PoliceHome extends StatefulWidget {
  const PoliceHome({super.key});

  @override
  State<PoliceHome> createState() => _PoliceHomeState();
}

class _PoliceHomeState extends State<PoliceHome> {
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
                  child: const Text('Laws'),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(50),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('HelpLine Numbers'),
                ),
              ),
            ],
          ),
        ));
  }
}
