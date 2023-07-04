import 'package:firebase_auth/firebase_auth.dart';

import '../models/direction_details_info.dart';
import '../models/user_model.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
List dList = []; //online-active drivers Information List
DirectionDetailsInfo? tripDirectionDetailsInfo;
String? chosenDriverId = "";
String cloudMessagingServerToken =
    "key=AAAAGI8_tBQ:APA91bGyhjobg2afkJv9d7q15DfQhPCg7E_Ym29qvXhyo1s8xsQcBU6ZBw6nI0EKuvDM4wambtsy0jgE2EsUFGzP9nXMHv-8NY_XHWN9i3tN74XNcfBhEt_8R3EpxTJOiwb8yshoBmMh";
String userDropOffAddress = "";
String driverCarDetails = "";
String driverName = "";
String driverPhone = "";
double countRatingStars = 0.0;
String titleStarsRating = "";
