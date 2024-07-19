import 'dart:developer';

import 'package:firebase_crud/database_service.dart';
import 'package:firebase_crud/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FirebaseHomeScreen extends StatefulWidget {
  const FirebaseHomeScreen({super.key});

  @override
  State<FirebaseHomeScreen> createState() => _FirebaseHomeScreenState();
}

class _FirebaseHomeScreenState extends State<FirebaseHomeScreen> {
  final _dbService = DatabaseService();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      appBar: AppBar(
        title: Text(
          "FireStore",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: "Name"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: "Email"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: "Phone"),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: EdgeInsets.symmetric(horizontal: 30)),
                      onPressed: () {
                        final user = User(
                            name: _nameController.text,
                            email: _emailController.text,
                            phone: _phoneController.text);
                        _dbService.create(user);
                      },
                      child: Text("Create")),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: EdgeInsets.symmetric(horizontal: 35)),
                      onPressed: () {
                        _dbService.read();
                      },
                      child: Text("Read")),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: EdgeInsets.symmetric(horizontal: 30)),
                      onPressed: () {
                        final user = User(
                            name: _nameController.text,
                            email: _emailController.text,
                            phone: _phoneController.text);
                        _dbService.create(user);
                        _dbService.update(user);
                      },
                      child: Text("Update")),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: EdgeInsets.symmetric(horizontal: 30)),
                      onPressed: () {
                        _dbService.delete();
                      },
                      child: Text("Delete")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
