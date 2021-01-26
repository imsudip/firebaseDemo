import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User extends ChangeNotifier{
  //final String userID;
  final String firstName;
  final String email;
  //final String profilePictureURL;
  final String school;
  final String classstuding;
  final String section;
  final String gender;
  
  User({
    //this.userID,
    this.firstName,
    this.email,
    //this.profilePictureURL,
    this.school,
    this.classstuding,
    this.section,
    this.gender,
  });

  Map<String, Object> toJson() {
    return {
      //'userID': userID,
      'firstName': firstName,
      'email': email == null ? '' : email,
      'school': school == null ? '' : school,
      'class': classstuding == null ? '' : classstuding,
      'section': section == null ? '' : section,
      'gender': gender == null ? '' : gender,
      //'profilePictureURL': profilePictureURL,
      'appIdentifier': 'student registration',
      'registration time stamp': DateTime.now().toString(),
    };
  }

  factory User.fromJson(Map<String, Object> doc) {
    User user = new User(
      //userID: doc['userID'],
      firstName: doc['firstName'],
      email: doc['email'],
      school: doc['school'],
      classstuding: doc['class'],
      section: doc['section'],
      gender: doc['gender'],
      //profilePictureURL: doc['profilePictureURL'],
    );
    return user;
  }

  factory User.fromDocument(DocumentSnapshot doc) {
    return User.fromJson(doc.data);
  }
  factory User.initialData(){
    return User(firstName: 'username',
    email: 'user@email.com',
    );
  }
}
