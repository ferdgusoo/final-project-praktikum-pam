import 'dart:io';

import 'package:flutter/material.dart';
import 'package:infra/models/country_model.dart';
import 'package:infra/pages/country_detail.dart';
import 'package:infra/pages/country_page.dart';
import 'package:infra/pages/currency_page.dart';
import 'package:infra/pages/external_time_page.dart';
import 'package:infra/pages/indo_time_page.dart';
import 'package:infra/services/country_service.dart';
import 'package:infra/styles/my_colors.dart';

import '../models/base_response.dart';
import '../services/picker.dart';
import 'home_page.dart';

class Camera extends StatefulWidget {
  const Camera ({super.key});

  @override
  State<Camera> createState() => _Camera();
}

class _Camera extends State<Camera> {
  String _ImagePath = ' ';
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: Icon(Icons.camera_alt_outlined,  color: Colors.white,),
    title: const Text('Kamera',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
    centerTitle: true,
    actions: <Widget>[
    Padding(
    padding: const EdgeInsets.all(12.0),
    )
    ],
    backgroundColor: primaryColor,
    ),
    body : Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover
          )
      ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),

            Text(
              "Ambil Foto Dari Galeri",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),

            ElevatedButton(
                onPressed: () {
                  _imagePickerHelper.getImageFromGallery((path) {
                    if (path != null){
                      setState(() {
                        _ImagePath = path;
                      });
                    }
                  }
                  );
                }, child: Icon(Icons.insert_drive_file)),

            SizedBox(
              height: 30,
            ),

            Text(
              "Ambil Foto Dari Kamera",
              style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
            ),

            ElevatedButton(
                onPressed: () {
                  _imagePickerHelper.getImageFromCamera(
                          (path) => path != null ?
                      setState(() => _ImagePath = path,) : null
                  );
                }, child: Icon(Icons.camera)),

            SizedBox(
              height: 30,
            ),

            Column(
              children: [
                Text("Hasil Foto  ", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                _ImagePath.isEmpty ? Container()
                  : File(_ImagePath).existsSync() ? Image.file(File(_ImagePath),
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                ) : Container(
                      child:Text(' Image Not Found ', style: TextStyle(color: Colors.white, fontSize: 15) ,),
                      decoration: BoxDecoration(
                        color: Colors.red,
                          border: Border.all(
                            width: 5.0 ,
                            color: Colors.red ,
                          ),
                        borderRadius: BorderRadius.circular(15),
                        ),
                    ),
              ],
            ),
          ]
        ),
    )
    );
  }
}
