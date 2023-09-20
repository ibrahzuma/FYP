import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../assistants/assistant_methods.dart';
import '../global/global.dart';

class SelectNearestActiveDriversScreen extends StatefulWidget {
  DatabaseReference? referenceRideRequest;

  SelectNearestActiveDriversScreen({this.referenceRideRequest});

  @override
  _SelectNearestActiveDriversScreenState createState() =>
      _SelectNearestActiveDriversScreenState();
}

class _SelectNearestActiveDriversScreenState
    extends State<SelectNearestActiveDriversScreen> {
  String fareAmount = "";

  getFareAmountAccordingToVehicleType(int index) {
    if (tripDirectionDetailsInfo != null) {
      if (dList[index]["car_details"]["type"].toString() == "mechanics") {
        fareAmount =
            (AssistantMethods.calculateFareAmountFromOriginToDestination(
                    tripDirectionDetailsInfo!))
                .toStringAsFixed(index);
      }
      if (dList[index]["car_details"]["type"].toString() ==
          "electrician") //means executive type of car - more comfortable pro level
      {
        fareAmount =
            (AssistantMethods.calculateFareAmountFromOriginToDestination(
                    tripDirectionDetailsInfo!))
                .toStringAsFixed(index);
      }
      if (dList[index]["car_details"]["type"].toString() ==
          "plumber") // non - executive car - comfortable
      {
        fareAmount =
            (AssistantMethods.calculateFareAmountFromOriginToDestination(
                    tripDirectionDetailsInfo!))
                .toString();
      }
    }
    return fareAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.white54,
        title: const Text(
          "Nearest Online Technician",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            //delete/remove the ride request from database
            widget.referenceRideRequest!.remove();
            Fluttertoast.showToast(
                msg: "you have cancelled the Technician request.");

            SystemNavigator.pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: dList.length,
        itemBuilder: (BuildContext context, int index) {
          //index = 4;
          return GestureDetector(
            onTap: () {
              setState(() {
                chosenDriverId = dList[index]["id"].toString();
              });
              Navigator.pop(context, "driverChoosed");
            },
            child: Card(
              color: Colors.white,
              elevation: 3,
              shadowColor: Colors.blue,
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Image.asset(
                    "images/" +
                        dList[index]["car_details"]["type"].toString() +
                        ".png",
                    width: 70,
                  ),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      dList[index]["name"],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    // Text(
                    //   dList[index]["car_details"]["type"],
                    //   style: const TextStyle(
                    //     fontSize: 12,
                    //     // color: Colors.white54,
                    //   ),
                    // ),
                    SmoothStarRating(
                      rating: dList[index]["ratings"] == null
                          ? 0.0
                          : double.parse(dList[index]["ratings"]),
                      color: Colors.blue,
                      borderColor: Colors.black,
                      allowHalfRating: true,
                      starCount: 5,
                      size: 15,
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   "\Tsh " + getFareAmountAccordingToVehicleType(index),
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                       Text(
                      dList[index]["car_details"]["type"],
                      style: const TextStyle(
                        fontSize: 12,
                        // color: Colors.white54,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      tripDirectionDetailsInfo != null
                          ? tripDirectionDetailsInfo!.duration_text!
                          : "",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    // Text(
                    //   tripDirectionDetailsInfo != null
                    //       ? tripDirectionDetailsInfo!.distance_text!
                    //       : "0.0",
                    //   style: const TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.black54,
                    //       fontSize: 12),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:test1/mainScreens/select_nearest_active_technician_screen.dart';

// class ListTech extends StatefulWidget {
//   const ListTech({super.key});

//   @override
//   State<ListTech> createState() => _ListTechState();
// }

// class _ListTechState extends State<ListTech> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.white54,
//         title: const Text(
//           "Choose the Technician",
//           style: TextStyle(
//             fontSize: 18,
//           ),
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           const SizedBox(
//             height: 5,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (c) => ListTech()),
//               );
//             },
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.white54),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     "images/mechanics.png",
//                     width: 50,
//                   ),
//                   const SizedBox(
//                     width: 30,
//                   ),
//                   const Text(
//                     "Mechanics",
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                   Expanded(
//                     child: Text(""),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (c) => ListTech()),
//               );
//             },
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.white54),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     "images/plumber.png",
//                     width: 50,
//                   ),
//                   const SizedBox(
//                     width: 30,
//                   ),
//                   const Text(
//                     "Plumber",
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                   Expanded(
//                     child: Text(""),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (c) => ListTech()),
//               );
//             },
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.white54),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     "images/electrician.png",
//                     width: 50,
//                   ),
//                   const SizedBox(
//                     width: 30,
//                   ),
//                   const Text(
//                     "Electrician",
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                   Expanded(
//                     child: Text(""),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
