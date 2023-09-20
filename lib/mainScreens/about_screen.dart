import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutScreen extends StatefulWidget {
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white54,
      body: ListView(
        children: [
          //image
          Container(
            height: 230,
            child: Center(
              child: Image.asset(
                "images/mechanics.png",
                width: 260,
              ),
            ),
          ),

          Column(
            children: [
              //company name
              const Text(
                "Technician Booking App",
                style: TextStyle(
                  fontSize: 28,
                  // color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //about you & your company - write some info
              const Text(
                "This app has been developed by Redmark Solution Limited,\n "
                "This is number one Technician Booking app. Available for all. ",
                // "20M+ people already use this app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  // color: Colors.white54,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              // const Text(
              //   "This app has been developed by Ibrahim Hussein, "
              //   "This is the world number 1 Technician Booking app. Available for all. ",
              //   // "20M+ people already use this app.",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: Colors.white54,
              //   ),
              // ),

              const SizedBox(
                height: 40,
              ),

              //close
              ElevatedButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Back",
                  // style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
