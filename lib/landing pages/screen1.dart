import 'package:fleetride/Police/police_login.dart';
import 'package:fleetride/Repair/repair_login.dart';
import 'package:fleetride/admin/admin_login.dart';
import 'package:fleetride/driver/driver_login.dart';
import 'package:fleetride/trip_community/trip_login.dart';
import 'package:fleetride/user/login.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminLogin()));
              },
              child: const Text('Admin',style: TextStyle(
                fontSize: 15,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
              ),))
        ],
      ),
      body: Container(
        // padding: const EdgeInsets.all(50),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/background.jpeg'),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PoliceLogin()));
                      },
                      child: const Text(
                        'Police',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .120),
            const Text(
              'Select User Type',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .030),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/user.jpg'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle),
                    height: 120,
                    width: 120,
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'USER',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .050,
                  width: MediaQuery.of(context).size.width * .050,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DriverLogin()));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/driver.jpg'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle),
                    height: 120,
                    width: 120,
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'DRIVER',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .050),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripLogin()));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/trip community.jpg'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle),
                    height: 120,
                    width: 120,
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'TRIP COMMUNITY',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .050,
                  width: MediaQuery.of(context).size.width * .050,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RepairLogin()));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/repair.jpg'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle),
                    height: 120,
                    width: 120,
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'REPAIR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
