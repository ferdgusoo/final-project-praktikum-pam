import 'package:flutter/material.dart';
import 'package:infra/pages/main_page.dart';
import 'package:infra/pages/sign_up_page.dart';
import 'package:infra/services/db_service.dart';

import '../styles/my_colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController userNameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool obscurePass = true;
  showPassword() {
    setState(() {
      obscurePass = !obscurePass;
    });
  }

  _validationForm() {
    if (userNameC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Masukan Username'),
      ));
    } else if (passwordC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Masukan Password'),
      ));
    } else {
      _loginUser();
    }
  }

  _loginUser() async {
    try {
      await DBService.instance.loginUser(userNameC.text, passwordC.text);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
          (Route<dynamic> route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error : ' + e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Masukan Akun Anda",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 40, 12, 20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      TextField(
                        controller: userNameC,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: const Text(
                              "USERNAME",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            hintText: "Masukan user name anda",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: passwordC,
                        obscureText: obscurePass,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: const Text(
                            "PASSWORD",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          hintText: "Masukan password anda",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          suffixIcon: obscurePass
                              ? GestureDetector(
                                  onTap: () {
                                    showPassword();
                                  },
                                  child: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ))
                              : GestureDetector(
                                  onTap: () {
                                    showPassword();
                                  },
                                  child: const Icon(
                                    Icons.lock_open,
                                    color: Colors.black,
                                  )),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                minimumSize: const Size(100, 50),
                                shape: const RoundedRectangleBorder()),
                            child: const Text(
                              "BATAL",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              _validationForm();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                minimumSize: const Size(150, 50),
                                shape: const RoundedRectangleBorder()),
                            child: const Text(
                              "MASUK",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Belum punya akun? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpPage()));
                              },
                              child: const Text(
                                "DAFTAR",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
