import 'package:flutter/material.dart';
import 'package:infra/models/country_model.dart';
import 'package:infra/pages/country_detail.dart';
import 'package:infra/services/country_service.dart';
import 'package:infra/styles/my_colors.dart';

import '../models/base_response.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Negara', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.language, color: Colors.white,),
          )
        ],
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: FutureBuilder<BaseResponse>(
                  future: CountryService().getListCountry(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.data != null) {
                        BaseResponse response = snapshot.data!;
                        if (response.data.isNotEmpty) {
                          return Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 10,
                            runSpacing: 20,
                            children: response.data.map((data) {
                              CountryModel country = data as CountryModel;
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CountryDetail(
                                            countryModel: country,
                                          )));
                                },
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width / 2 - 40,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor)),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                            border:
                                            Border.all(color: Colors.black),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    country.flags.png),
                                                fit: BoxFit.cover)),
                                      ),
                                      // Image.network(country.flags.png, fit: BoxFit.cover,
                                      // height: 100,),
                                      Spacer(),
                                      Text(
                                        country.name.common,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer()
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        } else {
                          return Container(
                              margin: const EdgeInsets.all(20),
                              padding: const EdgeInsets.all(10),
                              color: Colors.orangeAccent,
                              child: Center(
                                child: Text(response.message),
                              ));
                        }
                      }
                      return const Center(
                        child: Text("Terjadi Kesalahan"),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
