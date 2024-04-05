import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';

class RepairManage extends StatefulWidget {
  const RepairManage({super.key});

  @override
  State<RepairManage> createState() => _RepairManageState();
}

class _RepairManageState extends State<RepairManage> {
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
                  title: Text('Repair Name $index'),
                  trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Repair Id:'),
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
            itemCount: 5),
      ),
    );
  }
}
