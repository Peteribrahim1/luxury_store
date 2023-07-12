import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final currentUser = FirebaseAuth.instance.currentUser;
  //signup user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    String res = 'Please enter all the fields';
    try {
      if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);
        //add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'name': name,
          'email': email,
          'uid': cred.user!.uid,
        });
        res = 'success';
      }
    } on FirebaseAuthException catch (err) {
      print(err.code);
      if (err.code == 'invalid-email') {
        res = 'Wrong email format';
      } else if (err.code == 'weak-password') {
        res = 'Password cannot be less than 6 characters';
      } else if (err.code == 'email-already-in-use') {
        res = 'User already exist';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'Please enter all the fields';
      }
    } on FirebaseAuthException catch (err) {
      print(err.code);
      if (err.code == 'invalid-email') {
        res = 'Wrong email format';
      } else if (err.code == 'user-not-found') {
        res = 'User does not exist';
      } else if (err.code == 'wrong-password') {
        res = 'Wrong Password';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //add to cart
  Future<void> cart(String amount, String uid, String name,
      String image) async {
    try {
      if (name.isNotEmpty) {
      //  String commentId = const Uuid().v1();
        await _firestore
            .collection('cart')
            .doc(uid)
            .set({
          'amount': amount,
          'name': name,
          'uid': uid,
          'image': image,
        });
        print('done');
      } else {
        print('Text is empty');
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }


  // Future<String> addToCart({
  //   required String name,
  //   required String image,
  //   required String amount,
  // }) async {
  //   String res = 'Please enter all the fields';
  //   try {
  //     if (name.isNotEmpty && image.isNotEmpty && amount.isNotEmpty) {
  //       //add user to database
  //       await _firestore.collection('users').doc(cred.user!.uid).set({
  //         'name': name,
  //         'image': image,
  //         'amount': amount,
  //       });
  //       res = 'success';
  //     }
  //   } catch (err) {
  //     res = err.toString();
  //     print(err.toString());
  //   }
  //   return res;
  // }



  // reset password
  Future<String> resetPassword({
    required String newPassword,
  }) async {
    String res = 'Some error occured';

    try {
      if (newPassword.isNotEmpty) {
        await currentUser!.updatePassword(newPassword);
        FirebaseAuth.instance.signOut();
        res = 'success';
      } else {
        res = 'Please enter new password';
      }
    } catch (err) {
      // res = err.toString();
    }
    return res;
  }
}
