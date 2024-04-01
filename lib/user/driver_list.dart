import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';

class Drivers extends StatefulWidget {
  const Drivers({super.key});

  @override
  State<Drivers> createState() => _DriversState();
}

class _DriversState extends State<Drivers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => const Userhome()));
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
                    title: Text('Driver $index'),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('From:'), SizedBox(width: 30), Text('To:')],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Send Request'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreenAccent,
                        ),
                    )),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 10),
      ),
    );
  }
}
