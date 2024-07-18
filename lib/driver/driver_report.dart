import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:fleetride/driver/repairs_list.dart';
import 'package:intl/intl.dart';

class DriverReport extends StatefulWidget {
  const DriverReport({super.key, required this.userName, required this.phoneNumber});
  final String userName;
  final String phoneNumber;

  @override
  State<DriverReport> createState() => _DriverReportState();
}

class _DriverReportState extends State<DriverReport> {
  final formKey = GlobalKey<FormState>();
  var driverName = TextEditingController();
  var driverphone=TextEditingController();
  var vehicleNumber = TextEditingController();
  var vehicleIssue = TextEditingController();
  var reportDateController = TextEditingController(); // Controller for date text field
  DateTime? selectedDate; // Variable to hold selected date

  Future<dynamic> Report() async {
    await FirebaseFirestore.instance.collection("Report Issues").add({
      "Driver Name": driverName.text,
      "Driver Phone Number":driverphone.text,
      "Vehicle Number": vehicleNumber.text,
      "Vehicle Issue": vehicleIssue.text,
      "Repair Name": widget.userName,
      "Repair Phone Number": widget.phoneNumber,
      "Report Date": reportDateController.text,
    });
    print('done');
    Navigator.push(context, MaterialPageRoute(builder: (context) => RepairNamesList()));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Request Sent Successfully",
          style: TextStyle(fontSize: 15, color: Colors.green),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year+11),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        reportDateController.text = DateFormat('dd-MM-yyyy').format(selectedDate!); // Format and set date in text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('FleetRide'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DriverHome()),
                  );
                },
                icon: const Icon(Icons.home_outlined),
              ),
            ],
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.lightBlueAccent.shade200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Book Report",
                          style: GoogleFonts.ubuntu(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: driverName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Empty Name!";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        labelText: "Driver Name",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: driverphone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Empty Name!";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        labelText: "Driver Phone Number",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: vehicleNumber,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Empty Phone Number!";
                        } else if (value.length != 10 ||
                            !RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return "Invalid Phone Number";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        labelText: "Vehicle Number",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: vehicleIssue,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Empty!";
                        }
                        return null;
                      },
                      maxLines: 4,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        labelText: "Vehicle Issue",
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      readOnly: true,
                      controller: reportDateController,
                      onTap: () {
                        _selectDate(context); // Show date picker
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        labelText: "Report Date",
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate() && selectedDate != null) {
                        Report();
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Select Date'),
                            content: Text('Please select a date.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        height: 53,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            'Book',
                            style: GoogleFonts.ubuntu(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
