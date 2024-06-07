import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drivers extends StatefulWidget {
  const Drivers({Key? key});

  @override
  State<Drivers> createState() => _DriversState();
}

class _DriversState extends State<Drivers> {
  var ID;
  var userName;
  var phoneNumber;

  List<String> locationlist = ['Trip Request', 'Delivery Request'];
  String? selectedvalue;

  @override
  Future<void> sendRequest(
      String driverName, String driverPhone, String from, String to) async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    userName = spref.getString('name');
    phoneNumber = spref.getString('phone');

    await FirebaseFirestore.instance.collection("Request List").add({
      "User Name": userName,
      "Phone Number": phoneNumber,
      "Driver Name": driverName,
      "Driver Phone": driverPhone, // Add driver's phone number
      "From": from, // Add trip from
      "To": to, // Add trip to
      "Type Request": selectedvalue,
      "Status": "0",
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Request Sent Successfully",
          style: TextStyle(fontSize: 15, color: Colors.green),
        ),
      ),
    );
  }

  Future<void> _displayDropDownDialog(BuildContext context, String driverName,
      String driverPhone, String from, String to) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Select Category'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      value: selectedvalue,
                      items: locationlist.map((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (newvalue) {
                        setState(() {
                          selectedvalue = newvalue;
                          print(selectedvalue);
                        });
                      },
                      padding: const EdgeInsets.symmetric(horizontal: 10)),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('SEND'),
                onPressed: () {
                  sendRequest(driverName, driverPhone, from, to);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FleetRide'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                (context),
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
              future:
                  FirebaseFirestore.instance.collection("Create Trips").get(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error:${snapshot.error}"),
                  );
                }
                final mytrip = snapshot.data?.docs ?? [];
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.red.shade50,
                      child: ListTile(
                        title: Text(mytrip[index]["Driver Name"]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('From:'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(mytrip[index]["From"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text('To:'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(mytrip[index]["To"]),
                              ],
                            ),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _displayDropDownDialog(
                                context,
                                mytrip[index]["Driver Name"],
                                mytrip[index]["Driver Phone"],
                                mytrip[index]["From"],
                                mytrip[index]["To"],
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
                  itemCount: mytrip.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
