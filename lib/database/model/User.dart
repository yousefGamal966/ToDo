/*
class User {
  static const String collectionName = 'users';
  String? id;
  String? fullName;
  String? userName;
  String? email;

  User({this.id,this.fullName,this.userName,this.email});

  User.fromFireStore(Map<String,dynamic>? data){
    id = data?['id'];
    fullName = data?['fullN ame'];
    userName = data? ['userName'];
    email = data? ['email'];
  }

  Map<String,dynamic> toFireStore (){
    return{
      'id':id,
      'email':email,
      'fullName':fullName,
      'userName':userName
    };

  }
}*/