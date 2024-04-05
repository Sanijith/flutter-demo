import 'package:fleetride/trip_community/trip_comm_home.dart';
import 'package:flutter/material.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({super.key});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  int _itemcount=0;
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
                        builder: (context) => const TripHomeScreen()));
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
                  title: Text('Event $index'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' Location :'),
                      SizedBox(width: 30),
                      Text('Time :'),
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
            itemCount: _itemcount),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _itemcount++; // Increase item count on FAB press
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
