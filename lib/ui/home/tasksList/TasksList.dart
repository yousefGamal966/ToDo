import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/database/TasksDao.dart';
import 'package:todo/database/model/Task.dart';
import 'package:todo/providers/SettingsProvider.dart';
import 'package:todo/providers/TaskProvider.dart';
import 'package:todo/ui/home/tasksList/TaskWidget.dart';

import '../../../providers/AuthProvider.dart';

class TasksList extends StatefulWidget {

  @override
  State<TasksList> createState() => _TasksListState();


}

class _TasksListState extends State<TasksList> {
  DateTime selectedDay = DateTime.now();


  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var settingsProvider = Provider.of<SettingsProvider>(context);
    var taskProvider = Provider.of<TaskProvider>(context);

    return Column(
      children: [
        //SizedBox(height: 15,),
        CalendarTimeline(
          initialDate: selectedDay,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => setState(() {
            selectedDay = date;
          }),
          activeBackgroundDayColor: Theme.of(context).primaryColor,
          monthColor: Theme.of(context).hintColor,
        ),
        SizedBox(
          height: 30,
        ),

        Expanded(
            child: StreamBuilder(
          stream:taskProvider.listenTasks(selectedDay),
          builder: (context, snapshot) {
            print(selectedDay);
            print('+++++++++++');
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),

              );

            }
            if(snapshot.hasError)
{
  print(snapshot.error);
  print('++++++++++');
  return Container(height: 100,width: 100,color: Colors.red,);
}
            var tasksList = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return TaskWidget(tasksList![index]);
              },
              itemCount: tasksList?.length ?? 0,
            );
          },
        )),
      ],
    );
  }
}
