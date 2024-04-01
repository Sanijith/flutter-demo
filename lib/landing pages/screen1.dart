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
      body: Container(
        padding: EdgeInsets.all(50),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/bg image.jpeg'),
          fit: BoxFit.fill,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select User Type',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Text(
                        'USER',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 50,height: 50,),
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Text(
                        'DRIVER',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Text(
                        'TRIP COMMUNITY',
                        style: TextStyle(fontSize: 18,),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 50,height: 50,),
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Text(
                        'REPAIR',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){}, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Next'),
              Icon(Icons.arrow_forward)],
            ))
          ],
        ),
      ),
    );
  }
}
