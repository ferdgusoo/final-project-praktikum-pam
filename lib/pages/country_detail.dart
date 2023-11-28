import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infra/models/country_model.dart';
import 'package:infra/styles/my_colors.dart';

class CountryDetail extends StatelessWidget {
  final CountryModel countryModel;
  const CountryDetail({Key? key, required this.countryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(countryModel.name.common, style: TextStyle(color: Colors.white),),
        backgroundColor: primaryColor,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.language, color: Colors.white,),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    border:
                    Border.all(color: Colors.black),
                    image: DecorationImage(
                        image: NetworkImage(
                            countryModel.flags.png),
                        fit: BoxFit.cover)),
              ),
              SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text("Nama : ${countryModel.name.common}", style: TextStyle(fontSize: 20)),
                    Divider(),
                    Text("Ibu Kota : ${countryModel.capital}", style: TextStyle(fontSize: 20)),
                    Divider(),
                    Text("Benua : ${countryModel.region}", style: TextStyle(fontSize: 20)),
                    Divider(),
                    Text("Region : ${countryModel.subregion}", style: TextStyle(fontSize: 20)),
                    Divider(),
                    Text("Bahasa : ${countryModel.languages}", style: TextStyle(fontSize: 20)),
                    Divider(),
                    Text("Populasi : ${countryModel.population}", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),

              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
