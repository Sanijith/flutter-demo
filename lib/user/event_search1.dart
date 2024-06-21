import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class EventSearch1 extends StatefulWidget {
  const EventSearch1({super.key});

  @override
  State<EventSearch1> createState() => _EventSearch1State();
}

class _EventSearch1State extends State<EventSearch1> {
  TextEditingController _searchController = TextEditingController();
  late Future<QuerySnapshot> _eventFuture;
  void initState() {
    super.initState();
    _eventFuture =
        FirebaseFirestore.instance.collection("EventDetail").get();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('FleetRide'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Userhome()));
                },
                icon: const Icon(Icons.home_outlined)),
          ],
        ),
        backgroundColor: Colors.white,
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
                        "Events",
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
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _searchController,
              onChanged: (text) {
                setState(() {
                  _eventFuture = FirebaseFirestore.instance
                      .collection("EventDetail")
                      .where("Event Name", isGreaterThanOrEqualTo: text)
                      .where("Event Name",
                      isLessThanOrEqualTo: text + '\uf8ff')
                      .get();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for facilities',
                prefixIcon: Icon(Icons.search),
                border: UnderlineInputBorder(
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder(
                  future:_eventFuture,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error:${snapshot.error}"),
                      );
                    }
                    final event = snapshot.data?.docs ?? [];
                    return ListView.builder(
                      itemCount: event.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.red.shade50,
                          child: ListTile(
                            title: Text(
                              event[index]["Event Name"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      try {
                                        // Attempt to launch the telephone call
                                        await launch(
                                            'tel:${event[index]["Phone Number"]}');
                                      } catch (e) {
                                        // Handle any exceptions
                                        print(
                                            'Error launching telephone call: $e');
                                        // Display a friendly error message to the user
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Failed to launch phone call. Please check your device settings.'),
                                          ),
                                        );
                                      }
                                    },
                                    icon: Icon(Icons.call_outlined)),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Location: ${event[index]["Location"]}'),
                                Text('Time: ${event[index]["Time"]}'),
                                Text('Phone: ${event[index]["Phone Number"]}'),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
