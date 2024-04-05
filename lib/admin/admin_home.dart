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
              image: AssetImage('assets/bg image.jpeg'),
              fit: BoxFit.fill,
            )
        ),
        child: ListView(
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
          children: [
            Container(
              height: 150,
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserManage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),child: const Text('User Manage'),
              ),
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const DriverManage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),child: const Text('Driver Manage'),
              ),
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push((context), MaterialPageRoute(builder: (context)=>const TripManage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),child: const Text('Trip Manage'),
              ),
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const DeliveryManage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),child: const Text('Delivery Manage'),
              ),
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ContactManage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),child: const Text('Contact Manage'),
              ),
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ViewLaw()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),child: const Text(' View Laws'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
