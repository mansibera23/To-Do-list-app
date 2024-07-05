//Create a To-Do list app that allows users to add, edit, and delete tasks.

import 'package:flutter/material.dart';
import 'package:todo_app/taskslist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _controller= TextEditingController();
  List tasksList = [
    ['Task-1',false]
  ];
  void checkBoxChanged(int index){
    setState(() {
      tasksList[index][1] = !tasksList[index][1];
    });
  }
  void addTask(){
    setState(() {
      tasksList.add([_controller.text,false]);
      _controller.clear();
    });
  }
  void deleteTask(int index){
    setState(() {
      tasksList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        title: const Center(child: Text("To-Do List App",style: TextStyle(fontSize: 25),)),
        backgroundColor: Colors.indigo.shade400,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (BuildContext context,index){
            return TasksList(
              taskName: tasksList[index][0],
              taskDone: tasksList[index][1],
              onChanged: (value) => checkBoxChanged(index),
              deleteTaskFunction: (context) => deleteTask(index),
              );
      }),
      floatingActionButton:Padding(
        padding:const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children:[
          Expanded(
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child:TextField(
              controller:_controller,
            decoration: InputDecoration(
              hintText: 'Add new todo items',
              filled: true,
              fillColor: Colors.indigo.shade200,
              enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide(
                  color: Colors.indigo.shade300,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:  BorderSide(
                  color: Colors.indigo.shade300,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            ),
            ),
          ),
          FloatingActionButton(
            shape :  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            backgroundColor: Colors.indigo.shade400,
          onPressed: addTask,
            child: const Icon(Icons.add,
              color: Colors.white,

          ),
         ),


        ],
      ),
    ),
    );
  }
}
