import 'package:fleetride/driver/driver_home.dart';
import 'package:flutter/material.dart';

class DeliveryDecision extends StatefulWidget {
  const DeliveryDecision({super.key});

  @override
  State<DeliveryDecision> createState() => _DeliveryDecisionState();
}

class _DeliveryDecisionState extends State<DeliveryDecision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    (context),
                    MaterialPageRoute(
                        builder: (context) => const DriverHome()));
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
                    title: Text('Delivery Request $index',style: const TextStyle(fontSize: 20),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('User Name:'),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text('Weight:'),
                        const SizedBox(height: 30),
                        const Text('To:'),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                                child: const Text('Accept'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightGreenAccent,
                              ),
                            ),
                            const SizedBox(width: 30),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Reject'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    ),
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
