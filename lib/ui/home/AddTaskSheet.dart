import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/database/TasksDao.dart';
import 'package:todo/providers/AuthProvider.dart';
import 'package:todo/ui/DialogUtils.dart';
import 'package:todo/ui/common/CustomFormField.dart';

import '../../database/model/Task.dart';

class AddTaskSheet extends StatefulWidget {
  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add New Task',
              style:Theme.of(context).textTheme.titleMedium
            ),
            CustomFormFiled(
              hintText: 'Title',

              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'Please Enter Task Title';
                }
              },
              controller: titleController,
            ),
            CustomFormFiled(
              hintText: 'Description',

              lines: 4,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'Please Enter Task Title';
                }
              },
              controller: descriptionController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(onPressed:(){
                  showTaskDatePicker();
                },
                  child:Row(
                    children: [
                      Text(selectedDate == null?'Add Date    ':'${selectedDate?.day}/'
                          '${selectedDate?.month}/${selectedDate?.year}    '),
                      Icon(selectedDate == null?Icons.edit_calendar_outlined:Icons.calendar_month_outlined)

                    ],
                  ),

                ),
              ],
            ),
            Visibility(
              visible:showDateError,
              child: Text('Please Select Task Date',style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.error
              ),),
            ),
            ElevatedButton(onPressed: () {addTask();}, child: Text('Add New Task'))
          ],
        ),
      ),
    );
  }
bool showDateError = false;
  bool isValidForm(){
    bool isValid = true;
    if (formKey.currentState?.validate() == false){
      isValid = true;
  }
    if(selectedDate == null){
      setState(() {
        showDateError =true;

      });
     isValid = false;
    }
    return isValid;

  }
  void addTask()async {
    var authProvider = Provider.of<AuthProvider>(context,listen: false);
    if(!isValidForm()) return;
    Task task = Task(
      title: titleController.text,
      description: descriptionController.text,
      dateTime: DateUtils.dateOnly(selectedDate!).millisecondsSinceEpoch

    );
    DialogUtils.showLoading(context,'Creating Task Please Wait.');
    await TasksDao.createTask(task, authProvider.databaseUser!.id!);
    DialogUtils.hideDialog(context);
    DialogUtils.showMessage(context,'Task Created Successfully',isCancelable: false,
        posActionTitle:'OK',posAction: (){
          Navigator.pop(context);
        });

  }
  DateTime? selectedDate;
  void showTaskDatePicker()async {
    var date  = await showDatePicker(context: context,

        initialDate:selectedDate??DateTime.now(),
        firstDate: DateTime.now(),
        lastDate:DateTime.now().add(Duration(days: 365))
    ,
    );

      setState((){

        selectedDate = date;
        if(selectedDate!=null){
        showDateError = false;}
      });
  }
}

