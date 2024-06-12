import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// class IconButtonTextField extends StatefulWidget {
//   final IconData icon;
//   final String initialText;
//   final Function(String) onSubmit;
//
//   const IconButtonTextField({
//     Key? key,
//     required this.icon,
//     this.initialText = '',
//     required this.onSubmit,
//   }) : super(key: key);
//
//   @override
//   State<IconButtonTextField> createState() => _IconButtonTextFieldState();
// }
//
// class _IconButtonTextFieldState extends State<IconButtonTextField> {
//   bool _showTextField = false;
//   final TextEditingController _textController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _textController.text = widget.initialText;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 200),
//       width: _showTextField ? 200.0 : 50.0,
//       child: Row(
//         children: [
//           IconButton(
//             icon: Icon(widget.icon),
//             onPressed: () => setState(() => _showTextField = !_showTextField),
//           ),
//           if (_showTextField)
//             Expanded(
//               child: TextFormField(
//                 controller: _textController,
//                 decoration: InputDecoration(
//                   hintText: 'Search Event...',
//                 ),
//                 onFieldSubmitted: (text) {
//                   widget.onSubmit(text);
//                   setState(() => _showTextField = false);
//                   _textController.clear();
//                 },
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

class EventSearch1 extends StatefulWidget {
  const EventSearch1({super.key});

  @override
  State<EventSearch1> createState() => _EventSearch1State();
}

class _EventSearch1State extends State<EventSearch1> {
  // void handleSearch(String text) {
  //   print('Searching for Events: $text');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FleetRide'),
        actions: [
          // IconButtonTextField(
          //   icon: Icons.search,
          //   onSubmit: handleSearch,
          // ),
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
          Expanded(
            child: FutureBuilder(
                future:
                FirebaseFirestore.instance.collection("EventDetail").get(),
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
    );
  }
}
