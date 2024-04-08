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
              child: const Text('Admin'))
        ],
      ),
      body: Container(
        // padding: const EdgeInsets.all(50),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/bg image.jpeg'),
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
                      child: const Text('Police')),
                ),
              ],
            ),
            SizedBox(height: 90,),
            const Text(
              'Select User Type',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            const SizedBox(height: 30),
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
                      shape: BoxShape.circle
                    ),
                    height: 120,
                    width: 120,
                    child: const Column(
                      children: [
                        Text(
                          'USER',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                  height: 50,
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
                        shape: BoxShape.circle
                    ),
                    height: 120,
                    width: 120,
                    child: const Column(
                      children: [
                        Text(
                          'DRIVER',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
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
                        shape: BoxShape.circle
                    ),
                    height: 120,
                    width: 120,
                    child: const Column(
                      children: [
                        Text(
                          'TRIP COMMUNITY',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                  height: 50,
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
                        shape: BoxShape.circle
                    ),
                    height: 120,
                    width: 120,
                    child: const Column(
                      children: [
                        Text(
                          'REPAIR',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
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
