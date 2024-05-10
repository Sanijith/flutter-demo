import 'package:fleetride/driver/driver_home.dart';
import 'package:flutter/material.dart';

class MyTrip extends StatefulWidget {
  const MyTrip({super.key});

  @override
  State<MyTrip> createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLEETRIDE'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DriverHome()));
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                color: Colors.red.shade50,
                child: ListTile(
                  title: Text('Trip Id $index'),
                  trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline)),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('From:'),
                      Text('To:')
                    ],
                  ),
                ),
              );
            },
            // separatorBuilder: (context, index) {
            //   return const Divider();
            // },
            itemCount: 5),
      ),
    );
  }
}
