import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLEETRIDE'),
        backgroundColor: Colors.blueAccent,
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.home))],
      ),
      backgroundColor: Colors.cyan,
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
                fillColor: Colors.white,
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
                fillColor: Colors.white,
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
                fillColor: Colors.white,
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
