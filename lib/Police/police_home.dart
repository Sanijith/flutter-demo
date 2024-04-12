import 'package:fleetride/Police/contact_list.dart';
import 'package:fleetride/Police/police_edit.dart';
import 'package:fleetride/Police/police_profile.dart';
import 'package:fleetride/Police/section_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PoliceHome extends StatefulWidget {
  const PoliceHome({super.key});

  @override
  State<PoliceHome> createState() => _PoliceHomeState();
}

class _PoliceHomeState extends State<PoliceHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FleetRide'),
          backgroundColor: Colors.white,
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const PoliceProfile()));
            }, icon: Icon(Icons.person))
          ],
        ),

        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpeg'),
              fit: BoxFit.fill,
            )
          ),
          child: ListView(
            primary: true,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SectionList()));
                }, child: const Card(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(CupertinoIcons.book_solid,size: 40),
                    ),
                    SizedBox(width: 30,),
                    Text('Laws')
                  ],
                ),
              ),
              ),
              const SizedBox(height: 40,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ContactDetail()));
                }, child: const Card(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.contact_phone_outlined,size: 40),
                    ),
                    SizedBox(width: 30,),
                    Text('HelpLine Numbers')
                  ],
                ),
              ),
              ),
            ],
          ),
        ));
  }
}
