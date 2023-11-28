import 'package:flutter/material.dart';
import 'package:infra/styles/my_colors.dart';


import 'camera_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int indexPage = 0;

  menuChange(int index){
    setState(() {
      indexPage = index;
    });
  }

  List<Widget> menus = [
    const HomePage(),
    const Camera(),
    const ProfilePage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menus.elementAt(indexPage),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        selectedItemColor: Colors.white,
        currentIndex: indexPage,
        onTap: menuChange,
        items: const [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
              label: "Kamera",
              icon: Icon(Icons.camera_enhance)),
          BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person)),

        ],
      ),
    );
  }
}
