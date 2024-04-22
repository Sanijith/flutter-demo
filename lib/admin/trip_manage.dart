import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';

class TripManage extends StatefulWidget {
  const TripManage({super.key});

  @override
  State<TripManage> createState() => _TripManageState();
}

class _TripManageState extends State<TripManage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminHome()));
        }, icon:const Icon(Icons.home))],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                color: Colors.red.shade50,
                child: ListTile(
                  title: Text('Trip $index'),
                  trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.delete)),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Trip Id:'),
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
