import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  User? get user => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();


  /// Upload image to Firebase Storage and return URL
  Future<String> _uploadProfileImage(String imageFile, String uid) async {
    try {
      if(imageFile.isEmpty){
       return '';
      }
      final ref = _storage.ref().child('profile_images').child('$uid.jpg');
      await ref.putFile(File(imageFile));
      return await ref.getDownloadURL();
    } catch (e) {
      throw Exception("Failed to upload profile image.");
    }
  }

  Future<void> registerUser(String name, String email, String password, String profileUrl) async {

    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final imageUrl = await _uploadProfileImage(profileUrl, cred.user!.uid);

      await _firestore.collection('users').doc(cred.user!.uid).set({
        'uid': cred.user!.uid,
        'name': name,
        'email': email,
        'profileUrl': imageUrl,
      });

      notifyListeners();
    }
    on FirebaseAuthException catch (e) {
      String message = "Registration failed";
      if (e.code == 'email-already-in-use') {
        message = 'This email is already registered.';
      } else if (e.code == 'weak-password') {
        message = 'The password is too weak.';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email address.';
      }
      throw Exception(message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    }
    on FirebaseAuthException catch (e) {
      String message = "Login failed";
      if (e.code == 'user-not-found') {
        message = 'No user found with this email.';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password.';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email address.';
      }
      throw Exception(message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }
}