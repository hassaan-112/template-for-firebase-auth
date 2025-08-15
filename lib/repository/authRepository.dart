import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
class AuthRepository{
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference firestore=FirebaseFirestore.instance.collection("users");

  Future<void> signup(String email, String password, String name)async{
    UserCredential user=await _auth.createUserWithEmailAndPassword(email: email, password: password).timeout(Duration(seconds: 10));
    await firestore.doc(user.user!.uid).set({"name":name,"email":email,"uid":user.user!.uid,'created_at':Timestamp.now()});
  }
  Future<void> login(String email, String password)async{
    await _auth.signInWithEmailAndPassword(email: email, password: password).timeout(Duration(seconds: 10));

  }
}