
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:todo/database/model/User.dart';

/*class UsersDao {

  static CollectionReference<User>getUsersCollection (){
     var db = FirebaseFirestore.instance;
    var usersCollection = db.collection(User.collectionName)
        .withConverter(fromFirestore:(snapshot, options) =>User.fromFireStore(snapshot.data())
      , toFirestore: (object, options) => object.toFireStore() ,);
    return usersCollection;
  }
   static Future<void> createUser (User user){
    var usersCollection = getUsersCollection();
   var docs = usersCollection.doc(user.id);
   return docs.set(user);

  }
 
}*/