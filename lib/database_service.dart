import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

import 'package:firebase_crud/model.dart';

class DatabaseService{
  final _fire= FirebaseFirestore.instance;

  create(User user){
    try{
      _fire.collection("users").add(user.toMap());
    }catch(e){
      print(e.toString());
    }
  }

  read()async{
    try{
      final data= await _fire.collection("users").get();
      final user= data.docs[0];
     log(user["name"]);
     log(user["email"]);
     log(user["phone"]);
    }catch(e){
      print(e.toString());
    }
  }

  update(User user)async{
    try{
       await _fire.collection("users").doc().update(user.toMap());
    }catch(e){
      print(e.toString());
    }
  }

  delete()async{
    try{
    await _fire.collection("users").doc().delete();
    }catch(e){
      print(e.toString());
    }
  }
}