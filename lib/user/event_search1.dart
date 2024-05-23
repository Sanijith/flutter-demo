import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:flutter/material.dart';

class IconButtonTextField extends StatefulWidget {
  final IconData icon;
  final String initialText;
  final Function(String) onSubmit;

  const IconButtonTextField({
    Key? key,
    required this.icon,
    this.initialText = '',
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<IconButtonTextField> createState() => _IconButtonTextFieldState();
}

class _IconButtonTextFieldState extends State<IconButtonTextField> {
  bool _showTextField = false;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: _showTextField ? 200.0 : 50.0,
      child: Row(
        children: [
          IconButton(
            icon: Icon(widget.icon),
            onPressed: () => setState(() => _showTextField = !_showTextField),
          ),
          if (_showTextField)
            Expanded(
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Search Event...',
                ),
                onFieldSubmitted: (text) {
                  widget.onSubmit(text);
                  setState(() => _showTextField = false);
                  _textController.clear();
                },
              ),
            ),
        ],
      ),
    );
  }
}

class EventSearch1 extends StatefulWidget {
  const EventSearch1({super.key});

  @override
  State<EventSearch1> createState() => _EventSearch1State();
}

class _EventSearch1State extends State<EventSearch1> {
  void handleSearch(String text) {
    print('Searching for Events: $text');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection("EventDetail").get(),
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
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('FLEETRIDE'),
              actions: [
                IconButtonTextField(
                  icon: Icons.search,
                  onSubmit: handleSearch,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DriverHome()));
                    },
                    icon: const Icon(Icons.home)),
              ],
            ),
            backgroundColor: Colors.white,
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.red.shade50,
                      child: ListTile(
                        title: Text(event[index]["Event Name"]),
                        subtitle:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Location:'),
                                SizedBox(width: 10,),
                                Text(event[index]["Location"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Time:'),
                                SizedBox(width: 10,),
                                Text(event[index]["Time"]),
                              ],
                            ),
                            
                            Row(
                              children: [
                                Text('Phone:'),
                                SizedBox(width: 10,),
                                Text(event[index]["Phone Number"]),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: event.length),
            ),
          );
        });
  }
}
