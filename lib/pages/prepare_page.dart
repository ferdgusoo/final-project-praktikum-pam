import 'package:flutter/material.dart';
import 'package:infra/pages/sign_in_page.dart';
import 'package:infra/pages/sign_up_page.dart';
import 'package:infra/styles/my_colors.dart';

class PreparePage extends StatelessWidget {
  const PreparePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              const Spacer(),
              const Text("Selamat datang di aplikasi INFRA", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),),
              const Text("Info info negara", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),),
              const Spacer(),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: const Size(200, 50),
                        shape: const RoundedRectangleBorder()
                      ),
                      child: const Text("MASUK", style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: const Size(200, 50),
                          shape: const RoundedRectangleBorder()
                      ),
                      child: const Text("DAFTAR", style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
