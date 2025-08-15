import 'package:cloud_firestore/cloud_firestore.dart';

class Users{
  String userID = '';
  String userName = '';
  String email = '';
  Users(this.userID, this.userName, this.email);
  Users.fromSnapshot(DocumentSnapshot snapshot){
    userID = snapshot['uid'].toString();
    userName = snapshot['name'].toString();
    email = snapshot['email'].toString();
  }
}