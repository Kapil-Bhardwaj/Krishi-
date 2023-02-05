import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:pntd/Screens/welcomescreen.dart';
import 'package:pntd/TfliteModel.dart';
import 'package:pntd/auth_provider.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

Future  main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
// ChangeNotifierProvider(create: (_)=> AuthProvider());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return



      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> AuthProvider()),

      ],

      child:   MaterialApp(
        title: "Krishi",

        home: WelcomeScreen(),

      ),
    );
  }
}
