import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/database/TasksDao.dart';
import 'package:todo/ui/home/tasksList/TaskWidget.dart';

import '../../../providers/AuthProvider.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context,listen: false);
    return Column(
      children: [

        Expanded(

            child:StreamBuilder(stream:TasksDao.listenForTasks(authProvider.firebaseAuthUser?.uid??'') ,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if(snapshot.hasError){
                  print(snapshot);
                  print(authProvider.databaseUser?.fullName);
                  print(authProvider.databaseUser?.email);
                  print(authProvider.databaseUser?.id);
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Something Went Wrong. Please Try Again Later.'),
                        ElevatedButton(onPressed: (){

                        }, child:Text('Try Again'))
                      ],
                    ),
                  );
                }
                var tasksList = snapshot.data;
                return ListView.builder(itemBuilder: (context, index) {
                  return TaskWidget(tasksList![index]);

                },itemCount: tasksList?.length??0,);
              },)

        ),

      ],
    );
  }



}
