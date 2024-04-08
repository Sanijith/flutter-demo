import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';

class HelpLine extends StatefulWidget {
  const HelpLine({super.key});

  @override
  State<HelpLine> createState() => _HelpLineState();
}

class _HelpLineState extends State<HelpLine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLEETRIDE'),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Userhome()));
        }, icon: const Icon(Icons.home))],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child:
        ListView.separated(itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text('Contact $index'),
              trailing: IconButton(onPressed: (){}, icon:Icon(Icons.phone)),
            
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone Number:'),
                ],
              ),
            ),
          );
        },
            separatorBuilder: (context, index){
              return const Divider();
            },
            itemCount: 5),
      ),
      );
  }
}
