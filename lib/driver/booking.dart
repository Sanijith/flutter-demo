import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/driver/driver_home.dart';
import 'package:fleetride/driver/repairs_list.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverReport extends StatefulWidget {
  const DriverReport(
      {super.key, required this.userName, required this.phoneNumber});

  final String userName;
  final String phoneNumber;

  @override
  State<DriverReport> createState() => _DriverReportState();
}

class _DriverReportState extends State<DriverReport> {
  final formKey = GlobalKey<FormState>();
  var ID;
  var driverName = TextEditingController();
  var driverPhone = TextEditingController();
  var vehicleNumber = TextEditingController();
  var vehicleIssue = TextEditingController();
  var reportDateController = TextEditingController();
  DateTime selectedDateTime = DateTime.now();

  // Dropdown controllers
  void initState() {
    super.initState();
    getData();
  }
  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString('id');
    });
    print('Shared Preference data get');
  }
  String? selectedVehicleName;
  String? selectedServiceItem;
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  // Sample data for dropdown menus
  final List<String> vehicleNames = ['Vehicle 1', 'Vehicle 2', 'Vehicle 3'];
  final List<String> serviceItems = ['Brake', 'Engine', 'Transmission'];

  Future<void> report() async {
    try {
      // Convert TimeOfDay to string
      final timeString = _selectedTime?.format(context) ?? '';

      // Convert DateTime to timestamp
      final reportDateTimestamp = _selectedDate != null ? Timestamp.fromDate(_selectedDate!) : null;

      await FirebaseFirestore.instance.collection("Booking Send").add({
        "Driver Id":ID,
        "Driver Name": driverName.text,
        "Driver Phone Number": driverPhone.text,
        "Vehicle Name": selectedVehicleName,
        "Vehicle Number": vehicleNumber.text,
        "Service Item": selectedServiceItem,
        "Repair Name": widget.userName,
        "Repair Phone Number": widget.phoneNumber,
        "Date": reportDateTimestamp,
        "Time": timeString,
        "Status":"0",// Store time as string
      });

      // Show AlertDialog with a tick icon and styled text
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 50,
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Booked",
                style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DriverHome()),
                );
              },
              child: Text('OK', style: GoogleFonts.ubuntu(fontSize: 16)),
            ),
          ],
        ),
      );
    } catch (e) {
      // Handle errors here
      print('Error reporting issue: $e');
      // Optionally show an error dialog or message
    }
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 11),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        dateController.text = DateFormat('dd-MM-yyyy').format(_selectedDate!);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        timeController.text = '${_selectedTime!.format(context)}';
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

                  // Vehicle Name Dropdown
                  DropdownButtonFormField<String>(
                    value: selectedVehicleName,
                    items: vehicleNames.map((name) {
                      return DropdownMenuItem<String>(
                        value: name,
                        child: Text(name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedVehicleName = value;
                      });
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      labelText: "Select Vehicle Name",
                    ),
                    validator: (value) =>
                        value == null ? 'Please select a vehicle name' : null,
                  ),
                  SizedBox(height: 10),

                  // Vehicle Number
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: vehicleNumber,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Empty Vehicle Number!";
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
                  SizedBox(height: 10),

                  // Driver Name
                  TextFormField(
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
                  SizedBox(height: 10),

                  // Driver Phone Number
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: driverPhone,
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
                      labelText: "Driver Phone Number",
                    ),
                  ),
                  SizedBox(height: 10),

                  // Service Item Dropdown
                  DropdownButtonFormField<String>(
                    value: selectedServiceItem,
                    items: serviceItems.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedServiceItem = value;
                      });
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      labelText: "Select Service Item",
                    ),
                    validator: (value) =>
                        value == null ? 'Please select a service item' : null,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    readOnly: true,
                    controller: dateController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Empty!";
                      }
                      return null;
                    },
                    onTap: () {
                      _selectDate(context);
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      labelText: "Date",
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: timeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Empty!";
                      }
                      return null;
                    },
                    onTap: () {
                      _selectTime(context);
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      labelText: "Time",
                    ),
                  ),
                  SizedBox(height: 30),

                  // Submit Button
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate() &&
                          selectedVehicleName != null &&
                          selectedServiceItem != null) {
                        report();
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Incomplete Form'),
                            content: Text('Please complete all fields.'),
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
