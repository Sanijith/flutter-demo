import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/trip_community/facility_detail.dart';
import 'package:fleetride/trip_community/trip_comm_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditFacilityPage extends StatefulWidget {
  const EditFacilityPage({super.key,this .id});
  final id;

  @override
  State<EditFacilityPage> createState() => _EditFacilityPageState();
}

class _EditFacilityPageState extends State<EditFacilityPage> {
  final formKey = GlobalKey<FormState>();
  var facilityname = TextEditingController();
  var location = TextEditingController();
  var phone = TextEditingController();

  Future<dynamic> EditFacility() async {
    await FirebaseFirestore.instance.collection("FacilityDetail").doc(widget.id).update({
      "Facility Name": facilityname.text,
      "Location": location.text,
      "Phone Number": phone.text,
    });
    print("Update Successfully");
    Navigator.push(context, MaterialPageRoute(builder: (context)=>FacilityDetail()));
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
                    MaterialPageRoute(builder: (context) => const TripHomeScreen()),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.lightBlueAccent.shade200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Edit Facility",
                          style: GoogleFonts.ubuntu(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: facilityname,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Empty Name!";
                        }
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: "Facility Name",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: location,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Empty Location!";
                        }
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: "Location",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phone,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Empty Phone Number!";
                        }
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: "Phone Number",
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                      onTap: () {
                        if(formKey.currentState!.validate()) {
                          EditFacility();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                            height: 53,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                            child: Center(
                              child: Text('Save',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}