import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../main.dart';
import '../services/todo.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../styles/my_colors.dart';
import 'add_wish_list.dart';
import 'home_page.dart';


class WishList extends StatelessWidget {
  const WishList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish List', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.favorite_border, color: Colors.white,),
          )
        ],
        backgroundColor: primaryColor,
      ),

      body: ValueListenableBuilder(
          valueListenable: Hive.box<Todo>("TODOBOX").listenable(),
          builder: (context, Box<Todo> box, child) {
            if (box.values.isEmpty){
              return Center(
                child: Text('Buat Wish List Travellingmu!', style: TextStyle(fontSize: 20)),
              );
            }
            return _buildTodoList(box);
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodoListScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTodoList(Box<Todo> box) {
    return ListView.builder(
      itemCount: box.values.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            box.deleteAt(index);
          },
          background: Container(
            color: Colors.red.shade200,
          ),
          child: ListTile(
            title: Text(box.getAt(index)!.title),
            subtitle: Text(box.getAt(index)!.description),
            tileColor: Colors.green.shade100,
          ),
        );
      },
     );
   }

}
