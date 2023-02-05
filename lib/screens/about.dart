import 'package:flutter/material.dart';
import 'package:pntd/Widget/custom_button.dart';
import 'package:pntd/screens/team_info.dart';
class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/image5.jpeg"),
              SizedBox(height: 8,),
              Text("Happy Farmers!!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 14,),
              Image.asset("assets/image7.jpeg"),
              SizedBox(height: 8,),
              Center(

                  child: Text("Just Snap the Photo ... \nTo Know About The crop",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
              SizedBox(height: 22,),
              Text("Introduction",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(height: 8,),

              Text('''The " KRISHI- Farmer’s Interface " project intends to reduce the suffering of Indian farmers by giving them a technique for quickly identifying crop diseases so they may treat their crops before they decay. The software has been developed using Python, its libraries and Flutter.''')
              ,SizedBox(height: 10,),
              CustomButton(text: "Problem Statement", onPressed: (){
                showDialog(context: context, builder: (context)=> AlertDialog(
                  title: Text("Problem Statement"),
                  content: Text('''Farmer suicides in India refers to the national catastrophe of farmers committing suicide since the 1970s, due to their inability to repay loans mostly taken from private landlords and banks. NCRB data shows that the incidence of farmer suicides has remained high in the 6 years between 2014 and 2020. 5,600 farmers committed suicide in 2014, and 5,500 farmers committed suicide in 2020. If you add agri labourers to the 2020 number, the number of suicides rises to over 10,600. (CNBC report August 12, 2022). Crop failure is one of the major factors responsible for farmers committing suicide. Since the past days and in the present too, farmers usually detect the crop diseases with their naked eye which makes them take tough decisions on which fertilisers to use. It requires detailed knowledge the types of diseases and lot of experience needed to make sure the actual disease detection. Some of the diseases look almost similar to farmers often leaves them confused.'''),
                ));
              }),
              CustomButton(text: "What's Objective", onPressed: (){
                showDialog(context: context, builder: (context)=> AlertDialog(
                  title: Text("Our Objective"),
                  content: Text('''Since crop illnesses are the primary cause of the farmer suicides that occur annually in India, the " KRISHI- Farmer’s Interface " model helps Indian farmers by informing them how to recognize crop diseases.
Some key features of this project are:
A. Early disease prediction
B. Farmers can apply fertiliser and pesticides based on the disease found on their crop.
C. Can use this on their mobile
D. Take a photo of the diseased plant leaf to check for disease.
'''),
                ));
              }),
              CustomButton(text: "Team Info", onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TeamInfo()));
              })



            ],
          ),
        ),
      ),
    );
  }
}
