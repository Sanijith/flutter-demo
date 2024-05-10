import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';

class DeliveryManage extends StatefulWidget {
  const DeliveryManage({super.key});

  @override
  State<DeliveryManage> createState() => _DeliveryManageState();
}

class _DeliveryManageState extends State<DeliveryManage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AdminHome()));
              },
              icon: const Icon(Icons.home))
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                color: Colors.red.shade50,
                child: ListTile(
                  title: Text('Delivery $index'),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.delete)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Delivery Id:'),
                      SizedBox(width: 30),
                      Text('Weight')
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
