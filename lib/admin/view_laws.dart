import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';

class ViewLaw extends StatefulWidget {
  const ViewLaw({super.key});

  @override
  State<ViewLaw> createState() => _ViewLawState();
}

class _ViewLawState extends State<ViewLaw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Adminhome()));
        }, icon: const Icon(Icons.home))],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('Section $index'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' Topic :'),
                      SizedBox(width: 30),
                      Text('Fine'),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 5),
      ),
    );
  }
}