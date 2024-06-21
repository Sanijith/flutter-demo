import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleetride/Repair/repair_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditRepairPage extends StatefulWidget {
  const EditRepairPage({super.key});

  @override
  State<EditRepairPage> createState() => _EditRepairPageState();
}

class _EditRepairPageState extends State<EditRepairPage> {
  var ID;
  var rname;

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString('id');
      rname=spref.getString("RepairShopName");
    });
    print('Shared Preference data get');
  }
  final formKey=GlobalKey<FormState>();
  var name=TextEditingController();
  var location=TextEditingController();
  var phone=TextEditingController();

  Future<dynamic>Repair()async{
    await FirebaseFirestore.instance.collection("RepairList").add({
      "Repair Id":ID,
      "Repair Shop Name":rname,
      "Repair Name":name.text,
      "Location":location.text,
      "Phone Number":phone.text,
    });
    print('done');
    Navigator.pop(context);
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
                    MaterialPageRoute(builder: (context) => const RepairHome()),
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
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.lightBlueAccent.shade200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add Repair",
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
                      controller: name,
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
                        labelText: "Name",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: location,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Empty Location!";
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: "Location",
                        // suffixIcon: IconButton(
                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => DayPicker()));
                        //     },
                        //     icon: Icon(Icons.calendar_month_outlined))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
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
                        if (formKey.currentState!.validate())
                        {
                          Repair();
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
