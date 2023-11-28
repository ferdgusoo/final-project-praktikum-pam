import 'package:flutter/material.dart';

import '../styles/my_colors.dart';

class ExternalTimePage extends StatefulWidget {
  const ExternalTimePage({Key? key}) : super(key: key);

  @override
  State<ExternalTimePage> createState() => _ExternalTimePageState();
}

class _ExternalTimePageState extends State<ExternalTimePage> {
  TextEditingController inputTime = TextEditingController();
  TextEditingController londonTime = TextEditingController();
  TextEditingController moskowTime = TextEditingController();
  TextEditingController newYorkTime = TextEditingController();
  TextEditingController brasiliaTime = TextEditingController();
  TextEditingController singaporeTime = TextEditingController();
  TextEditingController chinaTime = TextEditingController();
  TextEditingController japanTime = TextEditingController();
  TextEditingController arabTime = TextEditingController();
  TextEditingController africaTime = TextEditingController();

  TimeOfDay timeOfDay = TimeOfDay.now();
  TimeOfDay time = TimeOfDay.now();
  bool showTime = false;

  Future displayTimePicker(BuildContext context) async {
    var timeTemp =
    await showTimePicker(context: context, initialTime: timeOfDay);

    if (timeTemp != null) {
      setState(() {
        time = timeTemp;
        inputTime.text = "${timeTemp.hour}:${timeTemp.minute}";
      });
    }
  }

  submit() {
    setState(() {
      showTime = true;
    });

    if(inputTime.text.isNotEmpty){
      var currentTime = DateTime.now();
      var temp = DateTime(currentTime.year,currentTime.month, currentTime.day, time.hour, time.minute,);

      var london = temp.toUtc().add(const Duration(hours: 0));
      londonTime.text = "${london.hour}:${london.minute}";
      var moskow = temp.toUtc().add(const Duration(hours: 3));
      moskowTime.text = "${moskow.hour}:${london.minute}";
      var ny = temp.toUtc().add(const Duration(hours: -5));
      newYorkTime.text = "${ny.hour}:${london.minute}";
      var brasilia = temp.toUtc().add(const Duration(hours: -3));
      brasiliaTime.text = "${brasilia.hour}:${london.minute}";
      var singapore = temp.toUtc().add(const Duration(hours: 8));
      singaporeTime.text = "${singapore.hour}:${london.minute}";
      var china = temp.toUtc().add(const Duration(hours: 8));
      chinaTime.text = "${china.hour}:${london.minute}";
      var japan = temp.toUtc().add(const Duration(hours: 9));
      japanTime.text = "${japan.hour}:${london.minute}";
      var arab = temp.toUtc().add(const Duration(hours: 3));
      arabTime.text = "${arab.hour}:${london.minute}";
      var africa = temp.toUtc().add(const Duration(hours: 2));
      africaTime.text = "${africa.hour}:${london.minute}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zona Waktu Luar', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.access_alarm, color: Colors.white,),
          )
        ],
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: inputTime,
                readOnly: true,
                onTap: () {
                  displayTimePicker(context);
                },
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: const Text("Waktu Indonesia Barat"),
                    hintText: "Pilih Jam",
                    suffixIcon: const Icon(Icons.access_time_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: (){
                  submit();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(150, 50),
                    shape: const RoundedRectangleBorder()
                ),
                child: const Text("SUBMIT", style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
              const Divider(
                thickness: 4,
              ),
              const SizedBox(
                height: 10,
              ),
              showTime
                  ? Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: londonTime,
                    readOnly: true,
                    enabled: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        label: const Text("London Inggris"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: moskowTime,
                    readOnly: true,
                    enabled: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        label: const Text("Mokkow Russia"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: newYorkTime,
                    readOnly: true,
                    enabled: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        label: const Text("New York America"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: brasiliaTime,
                    readOnly: true,
                    enabled: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        label: const Text("Rio de Janeiro Brazil"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: singaporeTime,
                    readOnly: true,
                    enabled: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        label: const Text("Singapore Singapore"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: chinaTime,
                    readOnly: true,
                    enabled: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        label: const Text("Beijing China"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: japanTime,
                    readOnly: true,
                    enabled: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        label: const Text("Tokyo Japan"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: arabTime,
                    readOnly: true,
                    enabled: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        label: const Text("Mekkah Arab"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: africaTime,
                    readOnly: true,
                    enabled: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        label: const Text("Kairo Africa"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
