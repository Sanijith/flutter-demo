import 'package:fleetride/driver/driver_home.dart';
import 'package:flutter/material.dart';

class UserRequest extends StatefulWidget {
  const UserRequest({super.key});

  @override
  State<UserRequest> createState() => _UserRequestState();
}

class _UserRequestState extends State<UserRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => const DriverHome()));
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                    title: Text('Delivery Request $index'),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('User Name:'),SizedBox(height: 30,),Text('Weight')],
                    ),
                    trailing: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Accept'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreenAccent,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Reject'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ],
                    )),
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
