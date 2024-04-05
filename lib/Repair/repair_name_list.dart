import 'package:fleetride/Repair/repair_home.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const RepairHome()));
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
                  title: Text('Repair Name $index'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Schedule:'), SizedBox(width: 30), Text('Phone Number:')],
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
            _itemcount++;
          });
        },
        child: Icon(
          Icons.add
        ),
      ),
    );
  }
}
