import 'package:fleetride/trip_community/trip_comm_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FacilityDetail extends StatefulWidget {
  const FacilityDetail({super.key});

  @override
  State<FacilityDetail> createState() => _FacilityDetailState();
}

class _FacilityDetailState extends State<FacilityDetail> {
  int _itemcount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('FLEETRIDE'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TripHomeScreen()));
                },
                icon: const Icon(Icons.home)),
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.red.shade50,
                  child: ListTile(
                    title: Text('Facility $index'),
                    subtitle:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(' Location:'),
                        SizedBox(width: MediaQuery.of(context).size.width*.030),
                        Text('Reg Fee:'),
                        SizedBox(width: MediaQuery.of(context).size.width*.030),
                        Text('Phone Number:')
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: _itemcount),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditFacilityPage()));
            setState(() {
              _itemcount++;
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}
class EditFacilityPage extends StatefulWidget {
  const EditFacilityPage({super.key});

  @override
  State<EditFacilityPage> createState() => _EditFacilityPageState();
}

class _EditFacilityPageState extends State<EditFacilityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    color: Colors.lightBlueAccent.shade200
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add Facility",
                      style: GoogleFonts.ubuntu(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(10),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: "Facility Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: "Location",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: "Fees",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: "Phone Number",
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.030),

              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                        height: 53,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                        ),
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
    );
  }
}

