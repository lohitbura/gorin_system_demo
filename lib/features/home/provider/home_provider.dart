import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gs_demo/features/home/models/user_model.dart';

class UsersProvider with ChangeNotifier {
  final List<UserModel> _users = [];

  List<UserModel> get users => _users;

  UsersProvider() {
    _listenToUsers();
  }

  void _listenToUsers() {
    FirebaseFirestore.instance.collection('users').snapshots().listen((snapshot) {
      _users.clear();
      for (var doc in snapshot.docs) {
        _users.add(UserModel.fromMap(doc.data()));
      }
      notifyListeners();
    });
  }
}