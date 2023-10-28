

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
    var authProvider = Provider.of<AuthProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Slidable(

        startActionPane: ActionPane(motion:DrawerMotion(),

            children:[

              SlidableAction(onPressed: (context)
              {
                  deleteTask();
              },
                icon:Icons.delete,backgroundColor: Colors.red,label: 'Delete' ,

              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(18),topLeft:Radius.circular(18),  ),
              ),
              SlidableAction(onPressed: (context)
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditScreen(widget.task),));
              },
                icon:Icons.edit,backgroundColor: Colors.blue,label: 'Edit' ,


              ),
            ]

        ),
        child: Card(
            margin: EdgeInsets.all(0),elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(18),bottomRight: Radius.circular(18))
            ),


          child: Container(
            padding: EdgeInsets.all(18),
            child: Row(
              children: [
                Container(
                  decoration:BoxDecoration(
                      color:widget.task.isDone?Colors.green:Theme.of(context).primaryColor,
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
                      color:widget.task.isDone?Colors.green: Theme.of(context).primaryColor
                    ),),
                    Text(widget.task.description??'',style: TextStyle(
                      color: Theme.of(context).hintColor
                    ),),
                  ],
                )),

                InkWell(

                  onTap: (){
                    widget.task.isDone ==false ?

                    DialogUtils.showMessage(context,'You Have Finished This Task',
                        posActionTitle: 'Yes',
                        posAction: (){
                          TasksDao.isDone(authProvider.firebaseAuthUser!.uid,widget.task);
                          setState(() {

                          });
                        },
                    negActionTitle: 'No',negAction: (){
                      return;
                        }
                    ):widget.task.isDone==true;

                  },

                  child:widget.task.isDone?Text('Done!',style: TextStyle(color: Colors.green,
                      fontWeight: FontWeight.bold,fontSize: 20),): Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(18)
                    ),
                    padding: EdgeInsets.symmetric(vertical:8 ,horizontal:24 ),
                    child: Icon(Icons.check,color: Colors.white,),
                  )
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: Color(0x6F1BFF00),
                  //       borderRadius: BorderRadius.circular(18)
                  //   ),
                  //   padding: EdgeInsets.symmetric(vertical:8 ,horizontal:24 ),
                  //   child: Text('Done!')
                  // )
                )
              ],
            ),
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
