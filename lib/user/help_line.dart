import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
        title: const Text('FleetRide'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Userhome()),
              );
            },
            icon: const Icon(Icons.home_outlined),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightBlueAccent.shade200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "HelpLine Numbers ",
                      style: GoogleFonts.ubuntu(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection("Contact Detail")
                    .get(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error:${snapshot.error}"),
                    );
                  }
                  final contact = snapshot.data?.docs ?? [];
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.red.shade50,
                          child: ListTile(
                            title: Text(contact[index]["Contact Name"]),
                            trailing: IconButton(
                                onPressed: () async {
                                  try {
                                    // Attempt to launch the telephone call
                                    await launch(
                                        'tel:${contact[index]["Phone Number"]}');
                                  } catch (e) {
                                    // Handle any exceptions
                                    print('Error launching telephone call: $e');
                                    // Display a friendly error message to the user
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Failed to launch phone call. Please check your device settings.'),
                                      ),
                                    );
                                  }
                                },
                                icon: Icon(Icons.call_outlined)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Phone Number:'),
                                    SizedBox(width: 10),
                                    Text(contact[index]["Phone Number"])
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: contact.length);
                }),
          ),
        ],
      ),
    );
  }
}
