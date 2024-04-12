import 'package:fleetride/admin/admin_login.dart';
import 'package:fleetride/admin/contact_manage.dart';
import 'package:fleetride/admin/delivery_manage.dart';
import 'package:fleetride/admin/driver_manage.dart';
import 'package:fleetride/admin/trip_manage.dart';
import 'package:fleetride/admin/user_manage.dart';
import 'package:fleetride/admin/view_laws.dart';
import 'package:flutter/material.dart';

class Adminhome extends StatefulWidget {
  const Adminhome({super.key});

  @override
  State<Adminhome> createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FleetRide'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push((context), MaterialPageRoute(builder: (context)=>const AdminLogin()));
          }, icon: const Icon(Icons.logout)),
        ],
        backgroundColor: Colors.white,
      ),
      body:  Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpeg'),
              fit: BoxFit.fill,
            )
        ),
        child: ListView(
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserManage()));
              }, child: const Card(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.manage_accounts_outlined,size: 40),
                  ),
                  SizedBox(width: 30,),
                  Text('User Manage')
                ],
              ),
            ),
            ),
            const SizedBox(height: 40,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const DriverManage()));
              }, child: const Card(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.manage_accounts_outlined,size: 40),
                  ),
                  SizedBox(width: 30,),
                  Text('Driver Manage')
                ],
              ),
            ),
            ),
            const SizedBox(height: 40,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const TripManage()));
              }, child: const Card(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.manage_accounts_outlined,size: 40),
                  ),
                  SizedBox(width: 30,),
                  Text('Trip Manage')
                ],
              ),
            ),
            ),
            const SizedBox(height: 40,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const DeliveryManage()));
              }, child: const Card(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.manage_accounts_outlined,size: 40),
                  ),
                  SizedBox(width: 30,),
                  Text('Delivery Manage')
                ],
              ),
            ),
            ),
            const SizedBox(height: 40,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ContactManage()));
              }, child: const Card(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.manage_accounts_outlined,size: 40,),
                  ),
                  SizedBox(width: 30,),
                  Text('Contact Manage')
                ],
              ),
            ),
            ),
            const SizedBox(height: 40,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ViewLaw()));
              }, child: const Card(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.remove_red_eye_outlined,size: 40),
                  ),
                  SizedBox(width: 30,),
                  Text('View Laws')
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
