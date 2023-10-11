import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/database/UsersDao.dart';
import 'package:todo/database/model/Task.dart';

class TasksDao{
  static CollectionReference<Task> getTasksCollection (String uid){
    return UsersDao.getUsersCollection().doc(uid).collection(Task.collectionName)
        .withConverter(fromFirestore:(snapshot, options) => Task.fromFireStore(snapshot.data())
        , toFirestore:(task, options) =>task.toFireStore() ,);
  }
  static Future<void> createTask(Task task,String uid){
  var doc = getTasksCollection(uid).doc();
  task.id = doc.id;
  return  doc.set(task);

  }
  static Future<List<Task>> getAllTasks (String uid)async{
  var  taskSnapshot = await getTasksCollection(uid).get();
  var tasksList = taskSnapshot.docs.map((snapshot) =>snapshot.data()).toList();
  return tasksList;
  }
  static Stream<List<Task>> listenForTasks (String uid)async*{
  var  stream = await getTasksCollection(uid).snapshots();
  yield* stream.map((querySnapshot) => querySnapshot.docs.map((doc) => doc.data()).toList());
  // var tasksList = taskSnapshot.docs.map((snapshot) =>snapshot.data()).toList();

  }

  static Future <void> removeTask(String taskId,String uid) {
    return getTasksCollection(uid).doc(taskId).delete();
  }
}