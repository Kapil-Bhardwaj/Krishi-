import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  State<TfliteModel> createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {

late File _image;
late  List _result;
 bool imageSelect = false;
  @override
  void initState()
  {
    super.initState();
    loadModel().then((value){
      setState(() {

      });
    });
  }
@override
void dispose()
{
  super.dispose();
  Tflite.close;
}
  Future loadModel()
  async {
    // Tflite.close();
    String res;
    res = (await Tflite.loadModel(model: "assets/output2.tflite", labels: "assets/label.txt"))!;
      print("model load status : ${res}");
  }

  imageClassification(File image) async{
  var recognitions = await Tflite.runModelOnImage(
  path: image.path,
  numResults: 5,
  threshold: 0.5,
  imageMean: 127.5,
  imageStd: 127.5,

  );

  setState((){
     _result = recognitions!;
     _image = image;
     imageSelect = true;

  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Image Classification"),
      ),
      body: ListView(
        children: [
          (imageSelect)? Container(
        margin: EdgeInsets.all(15),
        child: Image.file(_image),

      ):
          Container(
            margin: EdgeInsets.all(15),
            child: Opacity(
              opacity:0.8,
             child: Center(child: Column(
               children: [
                 Text("Please  Select a image !!!",style: TextStyle(
                   fontWeight:FontWeight.bold, fontSize: 24, color: Colors.red
                 ),),
                 SizedBox(height: 30,),
                 CircleAvatar(
                   child: Image.asset("assets/image4.jpeg"),
                   radius: 200,
                   backgroundColor: Colors.white,
                 )
               ],
             )),
            ),
          ),
      SingleChildScrollView(
        child: Column(
          children:
            (imageSelect)?_result.map((result){
               return Card(
                 child: Container(
                   margin: EdgeInsets.all(15),
                   child: Text(
                     " ${result['index']} . ${result['label']}  - ${result['confidence'] * 100} %  ",
                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                   ),
                 ),
               );
        }).toList():[],

        ),
      )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: "pick a image",
        child: const Icon(Icons.image),
      ),
    );
  }


  Future pickImage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,



    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }

}
