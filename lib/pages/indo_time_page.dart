import 'package:flutter/material.dart';
import 'package:infra/styles/my_colors.dart';
import 'package:intl/intl.dart';

class IndoTimePage extends StatefulWidget {
  const IndoTimePage({Key? key}) : super(key: key);

  @override
  State<IndoTimePage> createState() => _IndoTimePageState();
}

class _IndoTimePageState extends State<IndoTimePage> {
  TextEditingController inputTime = TextEditingController();
  TextEditingController wibTime = TextEditingController();
  TextEditingController witTime = TextEditingController();
  TextEditingController witaTime = TextEditingController();
  TextEditingController londonTime = TextEditingController();

  TimeOfDay timeOfDay = TimeOfDay.now();
  TimeOfDay time = TimeOfDay.now();
  bool showTime = false;
  DateFormat formatter = DateFormat.yMd().add_jms();

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
      var wib = TimeOfDay(hour: time.hour, minute: time.minute);
      wibTime.text = "${wib.hour}:${wib.minute}";
      var wita = TimeOfDay(hour: time.hour + 1, minute: time.minute);
      witaTime.text = "${wita.hour}:${wita.minute}";
      var wit = TimeOfDay(hour: time.hour + 2, minute: time.minute);
      witTime.text = "${wit.hour}:${wit.minute}";
      var london = TimeOfDay(hour: time.hour - 7, minute: time.minute);
      londonTime.text = "${london.hour}:${london.minute}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zona Waktu Indonesia', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.timelapse, color: Colors.white,),
          )
        ],
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
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
                    suffixIcon: Icon(Icons.access_time_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: (){
                  submit();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder()
                ),
                child: const Text("SUBMIT", style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
              Divider(
                thickness: 4,
              ),
              SizedBox(
                height: 10,
              ),
              showTime
                  ? Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: witaTime,
                    readOnly: true,
                    enabled: false,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        label: const Text("WITA (Makassar)"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: witTime,
                    readOnly: true,
                    enabled: false,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        label: const Text("WIT (Jayapura)"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
