import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactManage extends StatefulWidget {
  const ContactManage({Key? key}) : super(key: key);

  @override
  State<ContactManage> createState() => _ContactManageState();
}

class _ContactManageState extends State<ContactManage> {
  int _itemCount = 0;

  // Controllers for the text fields
  var _nameController = TextEditingController();
  var _phoneNumberController = TextEditingController();

  Future<dynamic> Contact() async {
    await FirebaseFirestore.instance.collection("Contact Detail").add({
      "Contact Name": _nameController.text,
      "Phone Number": _phoneNumberController.text,
    });
    print('done');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.home),
          ),
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
          SizedBox(
            height: 20,
          ),
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
                              onPressed: () {
                                setState(() {
                                  FirebaseFirestore.instance
                                      .collection("Contact Detail")
                                      .doc(contact[index].id)
                                      .delete();
                                });
                              },
                              icon: const Icon(Icons.delete)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Phone Number:'),
                                  SizedBox(width: 10),
                                  Text(contact[index]["Phone Number"])
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: contact.length,
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Show the add contact dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Contact'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(hintText: 'Name'),
                    ),
                    TextFormField(
                      controller: _phoneNumberController,
                      decoration: InputDecoration(hintText: 'Phone Number'),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Dismiss the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your logic to save the contact details
                      setState(() {
                        Contact();
                      });
                      // Clear text field controllers
                      _nameController.clear();
                      _phoneNumberController.clear();
                      // Dismiss the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text('Save'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
