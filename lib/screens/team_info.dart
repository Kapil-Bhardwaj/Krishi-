import 'package:flutter/material.dart';

class TeamInfo extends StatelessWidget {
  const TeamInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var x = TextStyle(fontSize: 18,fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: Text("Team Meambers"),
      backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               CircleAvatar(
                 radius: 70,
                   backgroundImage: AssetImage("assets/KapilPhoto.jpg"),
               ),
               SizedBox(height: 20,),
               Text("Name : Kapil Kumar Bhardwaj",style: x,),
               Text("Role : Software Developer",style: x,),

               SizedBox(height: 20,),
                SizedBox(height: 20,),
                CircleAvatar(
                  radius: 80,
                      foregroundImage: AssetImage("assets/deepak.jpeg"),
                  // child: Image.asset("assets/deepak.jpeg",),
                ),
                SizedBox(height: 40,),
                Text("Name : Deepak Sanwal",style: x,),
                Text("Role : Plant Desies\n Ml Model Developer",style: x,),

                SizedBox(height: 20,),

                CircleAvatar(
                  radius: 80,
                  foregroundImage: AssetImage("assets/bharat.jpeg"),
                  // child: Image.asset("assets/deepak.jpeg",),
                ),
                Text("Name : Bharat Chand",style: x,),
                Text("Role : Weather Prediction Model developel ",style: x,),

                SizedBox(height: 20,),

                CircleAvatar(
                  radius: 80,
                  foregroundImage: AssetImage("assets/vinay.jpeg"),
                  // child: Image.asset("assets/deepak.jpeg",),
                ),
                Text("Name : Vinay Singh Bora",style: x,),
                Text("Role : Software Developer",style: x,),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
