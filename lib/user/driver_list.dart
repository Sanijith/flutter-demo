import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_home.dart';

class Drivers extends StatefulWidget {
  const Drivers({Key? key});

  @override
  State<Drivers> createState() => _DriversState();
}

class _DriversState extends State<Drivers> {
  var userName;
  var phoneNumber;
  var address = TextEditingController();

  List<String> locationList = ['Trip Request', 'Delivery Request'];
  String? selectedValue;

  Future<void> sendRequest(String driverName, String driverPhone, String from, String to, String additionalInfo) async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    userName = spref.getString('name');
    phoneNumber = spref.getString('phone');

    // Extract the address from the TextEditingController
    String deliveryAddress = address.text;

    await FirebaseFirestore.instance.collection("Request List").add({
      "User Name": userName,
      "Phone Number": phoneNumber,
      "Driver Name": driverName,
      "Driver Phone": driverPhone,
      "From": from,
      "To": to,
      "Type Request": selectedValue,
      "Delivery Address": deliveryAddress,
      "Status": "0",
    });

    // Show an alert dialog for success
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Request Sent Successfully'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _displayDropDownDialog(BuildContext context, String driverName, String driverPhone, String from, String to) {
    String additionalInfo = ''; // State variable to hold the text entered in the TextFormField

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Category'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.transparent,
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  elevation: 0,
                  hint: Text(
                    "Category",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                  underline: const SizedBox(),
                  value: selectedValue,
                  items: locationList.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (newvalue) {
                    setState(() {
                      selectedValue = newvalue;
                      print(selectedValue);
                    });
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: address,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Empty Address";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: "Delivery Address",
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('SEND'),
              onPressed: () {
                sendRequest(driverName, driverPhone, from, to, additionalInfo); // Pass additionalInfo to the sendRequest method
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Userhome(),
                  ),
                );
              },
              icon: const Icon(Icons.home_outlined),
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
                        "Drivers ",
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
                future: FirebaseFirestore.instance.collection("Create Trips").get(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  }
                  final myTrips = snapshot.data?.docs ?? [];

                  // Filter out trips where the date and time are not in the future or current
                  final filteredTrips = myTrips.where((trip) {
                    // Parse date and time from Firestore document
                    DateTime tripDateTime = DateFormat("dd-MM-yyyy HH:mm").parse("${trip["Date"]} ${trip["Time"]}");

                    // Compare with current date and time
                    return tripDateTime.isAtSameMomentAs(DateTime.now()) || tripDateTime.isAfter(DateTime.now());
                  }).toList();

                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.red.shade50,
                        child: ListTile(
                          title: Text(
                            filteredTrips[index]["Driver Name"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("From: ${filteredTrips[index]["From"]}"),
                              Text("To: ${filteredTrips[index]["To"]}"),
                              Text('Date: ${filteredTrips[index]["Date"]}'),
                              Text('Time: ${filteredTrips[index]["Time"]}'),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _displayDropDownDialog(
                                  context,
                                  filteredTrips[index]["Driver Name"],
                                  filteredTrips[index]["Driver Phone"],
                                  filteredTrips[index]["From"],
                                  filteredTrips[index]["To"],
                                );
                              });
                            },
                            child: const Text('Send Request'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreenAccent,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: filteredTrips.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
