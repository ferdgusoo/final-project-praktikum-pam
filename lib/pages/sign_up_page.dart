import 'package:flutter/material.dart';
import 'package:infra/services/db_service.dart';

import '../models/user_model.dart';
import '../styles/my_colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();
  bool obscurePass = true;
  bool obscureConfirmPassword = true;

  showPassword() {
    setState(() {
      obscurePass = !obscurePass;
    });
  }

  showConfirmPassword() {
    setState(() {
      obscureConfirmPassword = !obscureConfirmPassword;
    });
  }

  _validateForm() {
    if (nameC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Nama tidak boleh kosong'),
      ));
    } else if (usernameC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('username tidak boleh kosong'),
      ));
    } else if (passwordC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('password tidak boleh kosong'),
      ));
    } else if (confirmPasswordC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Konfirmasi Password tidak boleh kosong'),
      ));
    } else if (confirmPasswordC.text != passwordC.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Konfirmasi Password tidak cocok'),
      ));
    } else {
      _registerUser();
    }
  }

  _registerUser() async {
    await DBService.instance.createUser(UserModel(
        userName: usernameC.text,
        name: nameC.text,
        address: addressC.text,
        password: passwordC.text));
    var list = await DBService.instance.readAllUser();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Berhasil daftar'),
    ));
    Navigator.pop(context);
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
                  "Daftarkan Data Anda",
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
                        controller: nameC,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: const Text(
                              "NAMA",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            hintText: "Masukan nama anda",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: usernameC,
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
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: confirmPasswordC,
                        obscureText: obscureConfirmPassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: const Text(
                            "PASSWORD",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          hintText: "Konfirmasi password",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          suffixIcon: obscureConfirmPassword
                              ? GestureDetector(
                                  onTap: () {
                                    showConfirmPassword();
                                  },
                                  child: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ))
                              : GestureDetector(
                                  onTap: () {
                                    showConfirmPassword();
                                  },
                                  child: const Icon(
                                    Icons.lock_open,
                                    color: Colors.black,
                                  )),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: addressC,
                        minLines: 5,
                        maxLines: 10,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: const Text(
                              "ALAMAT",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            hintText: "Masukan alamat anda",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
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
                              _validateForm();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                minimumSize: const Size(150, 50),
                                shape: const RoundedRectangleBorder()),
                            child: const Text(
                              "DAFTAR",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
