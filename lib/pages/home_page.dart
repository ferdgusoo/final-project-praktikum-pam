import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:infra/models/country_model.dart';
import 'package:infra/pages/camera_page.dart';
import 'package:infra/pages/country_detail.dart';
import 'package:infra/pages/country_page.dart';
import 'package:infra/pages/currency_page.dart';
import 'package:infra/pages/external_time_page.dart';
import 'package:infra/pages/indo_time_page.dart';
import 'package:infra/services/country_service.dart';
import 'package:infra/styles/my_colors.dart';

import '../models/base_response.dart';
import '../services/todo.dart';
import 'wish_list_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/banner.jpg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CountryPage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: Size(MediaQuery.of(context).size.width - 80, 50),
                  maximumSize: Size(MediaQuery.of(context).size.width - 80, 50),
                  shape: RoundedRectangleBorder()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "DAFTAR NEGARA",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Icon(
                    Icons.language,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CurrencyPage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: Size(MediaQuery.of(context).size.width - 80, 50),
                  maximumSize: Size(MediaQuery.of(context).size.width - 80, 50),
                  shape: RoundedRectangleBorder()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "MATA UANG",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Icon(
                    Icons.monetization_on,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => IndoTimePage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: Size(MediaQuery.of(context).size.width - 80, 50),
                  maximumSize: Size(MediaQuery.of(context).size.width - 80, 50),
                  shape: RoundedRectangleBorder()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ZONA WAKTU INDONESIA",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Icon(
                    Icons.access_time_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExternalTimePage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: Size(MediaQuery.of(context).size.width - 80, 50),
                  maximumSize: Size(MediaQuery.of(context).size.width - 80, 50),
                  shape: RoundedRectangleBorder()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ZONA WAKTU LUAR",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Icon(
                    Icons.access_time_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishList()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: Size(MediaQuery.of(context).size.width - 80, 50),
                  maximumSize: Size(MediaQuery.of(context).size.width - 80, 50),
                  shape: RoundedRectangleBorder()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "WISH LIST TRAVELLING",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
