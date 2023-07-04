import 'package:flutter/material.dart';
import 'package:test1/mainScreens/select_nearest_active_technician_screen.dart';

class ListTech extends StatefulWidget {
  const ListTech({super.key});

  @override
  State<ListTech> createState() => _ListTechState();
}

class _ListTechState extends State<ListTech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: const Text(
          "Choose the Technician",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => SelectNearestActiveDriversScreen()),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white54),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Image.asset(
                    "images/mechanics.png",
                    width: 50,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "Mechanics",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(""),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => SelectNearestActiveDriversScreen()),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white54),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Image.asset(
                    "images/plumber.png",
                    width: 50,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "Plumber",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(""),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => SelectNearestActiveDriversScreen()),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white54),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Image.asset(
                    "images/electrician.png",
                    width: 50,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "Electrician",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(""),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
