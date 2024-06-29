import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hatgebak/screens/FeedbackScreen.dart';
import 'package:hatgebak/screens/registerpage.dart';
import 'package:hatgebak/screens/CardDetailsScreen.dart';
//import 'package:hatgeback/screens/accountuser.dart';
import 'package:hatgebak/screens/FeedbackScreen.dart';
import 'package:hatgebak/screens/addpoint.dart';
import 'package:hatgebak/screens/homepage.dart';
import 'package:hatgebak/screens/loginscreen.dart';
import 'package:hatgebak/screens/myReservations.dart';
import 'package:hatgebak/screens/myparking.dart';
import 'package:hatgebak/screens/registerpage.dart';
import 'package:hatgebak/screens/userprofile.dart';
import 'package:hatgebak/payment/payscreen.dart';
import 'package:hatgebak/screens/myReservations.dart';
import 'package:isar/isar.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => mainmyapp();
}

class mainmyapp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        UserProfile.id: (context) => UserProfile(),
        loginscreen.id: (context) => loginscreen(),
        homepage.id: (context) => homepage(),
        registerpage.id: (context) => registerpage(),
        addpoint.id: (context) => addpoint(),
        myparking.id: (context) => myparking(),
        CardDetailsScreen.id: (context) => CardDetailsScreen(),
        payscreen.id: (contexts) => payscreen(),
        myReservations.id: (context) => myReservations(),
        FeedbackScreen.id: (context) => FeedbackScreen(),
      },
      initialRoute: loginscreen.id,
    );
    //momen to fatma
  }
}
