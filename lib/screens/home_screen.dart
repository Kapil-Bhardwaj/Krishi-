import 'package:flutter/material.dart';
import 'package:pntd/TfliteModel.dart';
import 'package:pntd/Widget/custom_button.dart';

import 'package:provider/provider.dart';
import 'package:tflite/tflite.dart';

import '../Screens/welcomescreen.dart';
import '../auth_provider.dart';
import 'about.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title:  Row(children: [Text("Welcome back.. "),Icon(Icons.man_outlined)],),
        actions: [
          IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Happy to See u again 😍",style: TextStyle(fontSize: 22),),
              CircleAvatar(
                backgroundColor: Colors.purple,
                backgroundImage: NetworkImage(ap.userModel.profilePic),
                radius: 100,
              ),
              const SizedBox(height: 30),
              Container(

                child: Column(

                children: [

                  Text(ap.userModel.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 const SizedBox(height: 10,),
                  Text(ap.userModel.phoneNumber),
                 const SizedBox(height: 10,),
                  Text(ap.userModel.email),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Text(ap.userModel.bio),

                  ),

                ],
              ),),

              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(text: "Scan A leaf", onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TfliteModel()));
                  }),
                  CustomButton(text: "Know about KRISHI", onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
                  }),
                ],
              ),

            ],
          )),
    );
  }
}
