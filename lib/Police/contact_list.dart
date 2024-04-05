import 'package:fleetride/Police/police_home.dart';
import 'package:flutter/material.dart';

class ContactDetail extends StatefulWidget {
  const ContactDetail({super.key});

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  int _itemCount = 0;
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
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PoliceHome()));
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
                  title: Text('Contact $index'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 30),
                      Text('Phone Number:')
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: _itemCount),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _itemCount++; // Increase item count on FAB press
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
