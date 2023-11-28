import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:infra/pages/wish_list_page.dart';

import '../main.dart';
import '../services/todo.dart';
import '../styles/my_colors.dart';
import 'home_page.dart';


class AddTodoListScreen extends StatefulWidget {
  const AddTodoListScreen ({super.key});

  @override
  State<AddTodoListScreen> createState() => _AddTodoListScreen();
}

class _AddTodoListScreen extends State<AddTodoListScreen> {
  final tittleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Wish List',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.add, color: Colors.white,),
          )
        ],
        backgroundColor: primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [

          TextField(
            controller: tittleController,
            decoration: InputDecoration(
              hintText: 'Negara',
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: 'Deskripsi',
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          ElevatedButton(
            onPressed: () {
              var newTodo = Todo(
                  title: tittleController.text,
                  description: descriptionController.text
              );

              Hive.box<Todo>("TODOBOX").add(newTodo);
              Navigator.pop(context);
            },
            child: const Text('Simpan', style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,),
          ),

        ],
      ),
    );
  }
}
