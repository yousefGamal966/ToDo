import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/database/TasksDao.dart';

import 'package:todo/database/model/Task.dart';
import 'package:todo/providers/AuthProvider.dart';
import 'package:todo/ui/DialogUtils.dart';
import 'package:todo/ui/home/HomeScreen.dart';


class EditScreen extends StatefulWidget {
  static const String routeName = 'edit';

  Task task;

  EditScreen(this.task);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  late DateTime selectedDate;
  @override
  void initState() {
    super.initState();
  selectedDate = DateTime.fromMillisecondsSinceEpoch(widget.task.dateTime!);
  titleController.text = widget.task.title!;
  descriptionController.text = widget.task.description!;
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(

      appBar: AppBar(title: Text('Edit'),elevation: 0,),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [

            Positioned(
              child: Container(
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.13,

              ),
            ),
            SingleChildScrollView(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 60,horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Edit Task',textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 26,fontWeight: FontWeight.w600,fontFamily: 'TaskHead',color: Theme.of(context).hintColor
                      ),),
                      Form(
                          key: formKey,
                          child: Column(
                        children: [
                          TextFormField(style: TextStyle(
                            color: Theme.of(context).hintColor
                          ),controller: titleController,

                          ),
                          TextFormField(
                            controller: descriptionController,

                          ),
                        ],
                      )),
                      SizedBox(height: 50,),
                      Text(
                        'Select Date',textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 20,fontFamily: 'TaskHead',color: Theme.of(context).hintColor
                      ),),SizedBox(height: 10,),
                     InkWell(
                       onTap: (){
                         showTaskDatePicker();
                       },
                       child: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',style: TextStyle(
                         color:Colors.blue
                       ),textAlign: TextAlign.center),
                     ),SizedBox(height: 20,),
                      ElevatedButton(onPressed: (){
                        Task taskModel = Task(title: titleController.text,description: descriptionController.text,
                            dateTime:DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch
                            ,id: widget.task.id,isDone: widget.task.isDone
                        );

                        TasksDao.updateTasks(authProvider.firebaseAuthUser?.uid??'',taskModel);
                        DialogUtils.showMessage(context, 'Your Task Changed Successfully',posActionTitle: 'OK',
                            posAction:(){
                          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                            } );
                      }, child: Text('Change Task')),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void showTaskDatePicker()async {
    var date  = await showDatePicker(context: context,

      initialDate:selectedDate,
      firstDate: DateTime.now(),
      lastDate:DateTime.now().add(Duration(days: 365))
      ,
    );

    setState((){


      if(date == null){
        return;}
      selectedDate =DateUtils.dateOnly(date);
    });
  }
}
