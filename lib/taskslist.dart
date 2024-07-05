import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class TasksList extends StatelessWidget{
  const TasksList({super.key, required this.taskName, required this.taskDone, required this.onChanged,required this.deleteTaskFunction});

  final String taskName;
  final bool taskDone;
  final Function(bool?)? onChanged;
  final Function(BuildContext)?deleteTaskFunction;
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 20,bottom: 0,left: 20,right: 20,),
      child:Slidable(
        endActionPane: ActionPane(
          motion:const StretchMotion(),
          children: [
            SlidableAction(
                onPressed:deleteTaskFunction,
                icon:Icons.delete,
                borderRadius: BorderRadius.circular(15),
                backgroundColor: Colors.white,
            ),
          ],
        ),
        child: Container(
        padding: const EdgeInsets.all(20),
        decoration:BoxDecoration(
            color: Colors.indigo.shade400,
            borderRadius: BorderRadius.circular(20)
        ),

        child: Row(
          children: [
            Checkbox(
                value: taskDone,
                onChanged: onChanged,
              checkColor: Colors.black,
              activeColor: Colors.white,
              side: const BorderSide(color: Colors.white),
            ),
            Text(
              taskName,
              style:  TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: taskDone ? TextDecoration.lineThrough : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2,
              ),

            ),
          ],
        ),
      ),
      ),
    );
  }
}