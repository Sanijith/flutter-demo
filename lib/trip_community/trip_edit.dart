import 'package:fleetride/trip_community/trip_comm_home.dart';
import 'package:flutter/material.dart';

class TripEdit extends StatefulWidget {
  const TripEdit({super.key});

  @override
  State<TripEdit> createState() => _TripEditState();
}

class _TripEditState extends State<TripEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLEETRIDE'),
        backgroundColor: Colors.white,
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const TripHomeScreen()));
        }, icon: const Icon(Icons.home))],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Edit Info',style:TextStyle(fontSize: 30)),
            const SizedBox(height: 30),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(30)),
                ),
                labelText: "UserName",
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(30)),
                ),
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(30)),
                ),
                labelText: "Phone Number",
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: (){
              Navigator.pop((context));
            },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent,
              ), child: const Text('Save'),)
          ],
        ),
      ),
    );
  }
}
