import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infra/styles/my_colors.dart';

import '../services/currency_service.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  TextEditingController usd = TextEditingController();
  TextEditingController idr = TextEditingController();
  TextEditingController sgd = TextEditingController();
  TextEditingController idr2 = TextEditingController();
  TextEditingController eur = TextEditingController();
  TextEditingController idr3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mata Uang', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.monetization_on, color: Colors.white,),
          )
        ],
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text("Konversi mata uang per tanggal 19 November 2023",),
              const SizedBox(height: 10,),
              const Text("Dollar Amerika", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
              TextField(
                controller: usd,
                onChanged: (v){
                  if(v.isEmpty){
                    idr.text = v;
                  }else{
                    idr.text = CurrencyService().usdToIdr(double.parse(v)).toString();
                  }
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    label: const Text("Masukan nilai USD"),
                    hintText: "Masukan nilai USD",
                    prefixIcon: Container(
                        width: 10,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: const BoxDecoration(
                            border: Border(right: BorderSide(width: 2, color: Colors.grey))
                        ),
                        child: const Center(child: Text("USD"))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: idr,
                onChanged: (v){
                  if(v.isEmpty){
                    usd.text = v;
                  }else{
                    usd.text = CurrencyService().idrToUsd(double.parse(v)).toString();
                  }
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    label: const Text("Masukan nilai IDR"),
                    hintText: "Masukan nilai IDR",
                    prefixIcon: Container(
                        width: 10,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: const BoxDecoration(
                            border: Border(right: BorderSide(width: 2, color: Colors.grey))
                        ),
                        child: const Center(child: Text("IDR"))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 10,),
              const Divider(thickness: 4,),
              const SizedBox(height: 10,),
              const Text("Dollar Singapura", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
              TextField(
                controller: sgd,
                onChanged: (v){
                  if(v.isEmpty){
                    idr2.text = v;
                  }else{
                    idr2.text = CurrencyService().sgdToIdr(double.parse(v)).toString();
                  }
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    label: const Text("Masukan nilai SGD"),
                    hintText: "Masukan nilai SGD",
                    prefixIcon: Container(
                        width: 10,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: const BoxDecoration(
                            border: Border(right: BorderSide(width: 2, color: Colors.grey))
                        ),
                        child: const Center(child: Text("SGD"))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: idr2,
                onChanged: (v){
                  if(v.isEmpty){
                    sgd.text = v;
                  }else{
                    sgd.text = CurrencyService().idrToSgd(double.parse(v)).toString();
                  }
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    label: const Text("Masukan nilai IDR"),
                    hintText: "Masukan nilai IDR",
                    prefixIcon: Container(
                        width: 10,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: const BoxDecoration(
                            border: Border(right: BorderSide(width: 2, color: Colors.grey))
                        ),
                        child: const Center(child: Text("IDR"))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 10,),
              const Divider(thickness: 4,),
              const SizedBox(height: 10,),const Text("EURO", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
              TextField(
                controller: eur,
                onChanged: (v){
                  if(v.isEmpty){
                    idr3.text = v;
                  }else{
                    idr3.text = CurrencyService().eurToIdr(double.parse(v)).toString();
                  }
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    label: const Text("Masukan nilai EUR"),
                    hintText: "Masukan nilai EUR",
                    prefixIcon: Container(
                        width: 10,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: const BoxDecoration(
                            border: Border(right: BorderSide(width: 2, color: Colors.grey))
                        ),
                        child: const Center(child: Text("EUR"))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: idr3,
                onChanged: (v){
                  if(v.isEmpty){
                    eur.text = v;
                  }else{
                    eur.text = CurrencyService().idrToEur(double.parse(v)).toString();
                  }
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    label: const Text("Masukan nilai IDR"),
                    hintText: "Masukan nilai IDR",
                    prefixIcon: Container(
                        width: 10,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: const BoxDecoration(
                            border: Border(right: BorderSide(width: 2, color: Colors.grey))
                        ),
                        child: const Center(child: Text("IDR"))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 50,),

            ],
          ),
        ),
      ),
    );
  }
}
