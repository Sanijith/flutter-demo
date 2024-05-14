import 'package:fleetride/first.dart';
import 'package:fleetride/user/driver_list.dart';
import 'package:fleetride/user/edit.dart';
import 'package:fleetride/user/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryRequest extends StatefulWidget {
  const DeliveryRequest({super.key});

  @override
  State<DeliveryRequest> createState() => _DeliveryRequestState();
}

class _DeliveryRequestState extends State<DeliveryRequest> {
  final formKey=GlobalKey<FormState>();
  var from=TextEditingController();
  var to =TextEditingController();
  var weight=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(),
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
                        "Delivery Request",
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
                    controller: from,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Empty";
                      }
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelText: "From",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: to,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Empty";
                      }
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelText: "To",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: weight,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Empty";
                      }
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelText: "Weight",
                    ),
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                    onTap: () {
                     if(formKey.currentState!.validate()){
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context) => Drivers()));
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
                            child: Text('Search Drivers',
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
    );
  }
}
