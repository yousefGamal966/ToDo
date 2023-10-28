import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';

import '../database/TasksDao.dart';
import '../database/model/Task.dart';

class TaskProvider extends ChangeNotifier{
  List<Task> tasks =[];
  String? uid;
  Future<void> addTask (Task task)async{
    await TasksDao.createTask(task,uid!);
    notifyListeners();
    return;
  }
  Future<void> deleteTask (Task task)async{
  await TasksDao.removeTask(task.id!, uid!);
  notifyListeners();
  return;
  }
  Future<List<Task>>
  getAllTasks(DateTime date)async{

    return TasksDao.getAllTasks(uid!,date);

  }
  Stream<List<Task>>
  listenTasks(DateTime date)async*{

    yield* TasksDao.listenForTasks(uid!,date);


  }
}
