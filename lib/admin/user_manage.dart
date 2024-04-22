import 'package:fleetride/admin/admin_home.dart';
import 'package:flutter/material.dart';

class UserManage extends StatefulWidget {
  const UserManage({super.key});

  @override
  State<UserManage> createState() => _UserManageState();
}

class _UserManageState extends State<UserManage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminHome()));
        }, icon: const Icon(Icons.home))],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                color: Colors.red.shade50,
                child: ListTile(
                    title: Text('User $index'),
                  trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                    subtitle:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('User Id:'), SizedBox(width: MediaQuery.of(context).size.width*.030), Text('Phone Number:')],
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
