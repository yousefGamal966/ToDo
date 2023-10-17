import 'package:flutter/material.dart';

import 'package:todo/database/model/Task.dart';


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

  @override
  Widget build(BuildContext context) {

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
            Card(
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
                        ),
                          initialValue:widget.task.title,
                            onChanged: (String value) {
                              widget.task.title = value;
                            }
                        ),
                        TextFormField(
                          initialValue:widget.task.description,

                          onChanged: (String value) {
                            widget.task.description = value;
                          }

                        ),
                      ],
                    )),
                    SizedBox(height: 50,),
                    Text(
                      'Select Date',textAlign: TextAlign.start,style: TextStyle(
                        fontSize: 20,fontFamily: 'TaskHead',color: Theme.of(context).hintColor
                    ),),
                    Text('${widget.task.dateTime!.year}/${widget.task.dateTime!.month}/${widget.task.dateTime!.day}'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
