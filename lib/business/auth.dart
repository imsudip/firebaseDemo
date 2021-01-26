import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';

import 'package:student_registration/models/user.dart';
import 'package:flutter/services.dart';
import 'package:student_registration/ui/screens/showalertscreen.dart';
import 'package:student_registration/ui/widgets/custom_alert_dialog.dart';

enum authProblems { UserNotFound, PasswordNotValid, NetworkError, UnknownError }

class Auth {
  static void addUser(User user, BuildContext context) async {
    checkUserExist(user.email).then((value) {
      if (!value) {
        print("user ${user.firstName} ${user.email} added");
        Firestore.instance
            .document("users/${user.email}")
            .setData(user.toJson())
            .whenComplete(() {
          Navigator.pop(context);
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return CustomAlertDialog(
                title: "Successfully registered",
                content: "Thank you for registering the form",
                onPressed: () {},
              );
            },
          );
        });
      } else {
        if (Navigator.pop(context)) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return CustomAlertDialog(
                title: "Account already exists",
                content:
                    "Email you have used is already linked with another account",
                onPressed: () {},
              );
            },
          );
        }

        print("user ${user.firstName} ${user.email} exists");
        //CustomAlertDialog(title: "User exists",content: "The email you have used is already used in another account",onPressed: (){},);
      }
    });
  }

  static Future<bool> checkUserExist(String email) async {
    bool exists = false;
    try {
      await Firestore.instance.document("users/$email").get().then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      return exists;
    } catch (e) {
      return false;
    }
  }

  static Stream<User> getUser(String email) {
    return Firestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      return snapshot.documents.map((doc) {
        return User.fromDocument(doc);
      }).first;
    });
  }
 static Future getUserList() async{
    var firestore= Firestore.instance;
    QuerySnapshot qn = await firestore.collection("users").getDocuments();
    return qn.documents;
  }
  static String getExceptionText(Exception e) {
    if (e is PlatformException) {
      switch (e.message) {
        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
          return 'User with this e-mail not found.';
          break;
        case 'The password is invalid or the user does not have a password.':
          return 'Invalid password.';
          break;
        case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
          return 'No internet connection.';
          break;
        case 'The email address is already in use by another account.':
          return 'Email address is already taken.';
          break;
        default:
          return 'Unknown error occured.';
      }
    } else {
      return 'Unknown error occured.';
    }
  }
}
