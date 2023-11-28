import 'package:flutter/material.dart';
import 'package:infra/pages/prepare_page.dart';
import 'package:infra/pages/sign_in_page.dart';

import '../styles/my_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.person_2_outlined,  color: Colors.white,),
            title: const Text('Profile',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: <Widget>[
        Padding(
        padding: const EdgeInsets.all(12.0),
        )
        ],
        backgroundColor: primaryColor,
        ),
     body : SingleChildScrollView(
        child : Container(
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

              CircleAvatar(
                backgroundImage: AssetImage('assets/aiko.jpg'),
                radius: 65,
              ),

              const SizedBox(height: 10,),

              Container(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: const Column(
                  children: [
                    Text("Nama : ", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("Aurelia Aiko Adinda", textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
                    const SizedBox(height: 10,),
                    Text("NIM : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("124210027", style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),

              const SizedBox(height: 35,),

              CircleAvatar(
                backgroundImage: AssetImage('assets/ardhan.jpg'),
                radius: 65,
              ),

              const SizedBox(
                height: 10,
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: const Column(
                  children: [
                    Text("Nama : ", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("Ardhana Firdaus Erliasnanda Fasya", textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
                    const SizedBox(height: 10,),
                    Text("NIM : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("124210054", style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),

              Spacer(),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: ()async {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignInPage()), (Route<dynamic> route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: const Size(150, 50),
                      shape: const RoundedRectangleBorder()
                  ),
                  child: const Text("KELUAR", style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              ),
              const SizedBox(height: 40,)

            ],
          ),
        )
    )
    );
  }
}
