

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/database/TasksDao.dart';
import 'package:todo/providers/AuthProvider.dart';
import 'package:todo/ui/DialogUtils.dart';
import 'package:todo/ui/edit/EditScreen.dart';

import '../../../database/model/Task.dart';

class TaskWidget extends StatefulWidget {
Task task;
TaskWidget(this.task);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Slidable(

      startActionPane: ActionPane(motion:DrawerMotion(),

          children:[

            SlidableAction(onPressed: (context){
                deleteTask();
            },icon:Icons.delete,backgroundColor: Colors.red,label: 'Delete Task',

            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(18),topLeft:Radius.circular(18)  ),
            )
          ]),
      child: InkWell(
        onTap: (){
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditScreen(widget.task),));
        },
        child:

        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),

          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 12),

          decoration: BoxDecoration(

            color:Theme.of(context).canvasColor,

          ),
          child: Row(
            children: [
              Container(
                decoration:BoxDecoration(
                    color:Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(18)
                ),
                width: 4,
                height: 64,
              ),
              Expanded(child: Column(
                children: [
                  Text(widget.task.title??"",style: TextStyle(
                     fontSize: 18,
                    fontFamily: 'TaskHead',
                    color: Theme.of(context).primaryColor
                  ),),
                  Text(widget.task.description??'',style: TextStyle(
                    color: Theme.of(context).hintColor
                  ),),
                ],
              )),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(18)
                ),
                padding: EdgeInsets.symmetric(vertical:8 ,horizontal:24 ),
                child: ImageIcon(AssetImage('assets/images/check.png'),color: Colors.white,),
              )
            ],
          ),
        ),
      ),
    );
  }

  void deleteTask() {

    DialogUtils.showMessage(context,'Are You Sure To Delete This Task',posAction:(){
      deleteTaskFromFireStore();
    },posActionTitle: 'Yes',negActionTitle:'No' );

  }

  void deleteTaskFromFireStore()async {
    var authProvider = Provider.of<AuthProvider>(context,listen: false);
    await TasksDao.removeTask(widget.task.id!,authProvider.databaseUser!.id!);

  }
}
