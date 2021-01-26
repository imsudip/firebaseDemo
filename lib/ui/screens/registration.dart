import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:student_registration/business/auth.dart';
import 'package:student_registration/business/validator.dart';
import 'package:student_registration/models/user.dart';
import 'package:student_registration/ui/screens/listpage.dart';
import 'package:student_registration/ui/widgets/custom_loading.dart';
import 'package:student_registration/ui/widgets/custom_text_field.dart';
import 'package:student_registration/ui/widgets/strings.dart';

class Studentregistrtion extends StatefulWidget {
  Studentregistrtion({Key key}) : super(key: key);

  _StudentregistrtionState createState() => _StudentregistrtionState();
}

class _StudentregistrtionState extends State<Studentregistrtion> {
  final TextEditingController _fullname = new TextEditingController();
  final TextEditingController _school = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _class = new TextEditingController();
  final TextEditingController _section = new TextEditingController();
  CustomTextField _nameField;
  CustomTextField _emailField;
  CustomTextField _schoolField;
  CustomTextField _classField;
  CustomTextField _sectionField;
  bool _blackVisible = false;
  String gender = "MALE";
  @override
  void initState() {
    super.initState();

    _nameField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: main_blue,
      errorColor: redsoft,
      controller: _fullname,
      hint: "Full Name",
      validator: Validator.validateName,
    );
    _emailField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: main_blue,
      errorColor: redsoft,
      controller: _email,
      hint: "E-mail",
      validator: Validator.validateEmail,
    );
    _schoolField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: main_blue,
      errorColor: redsoft,
      controller: _school,
      hint: "School",
      validator: Validator.validateName,
    );
    _sectionField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: main_blue,
      errorColor: redsoft,
      controller: _section,
      hint: "Section",
      validator: Validator.validatesection,
    );
    _classField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: main_blue,
      errorColor: redsoft,
      controller: _class,
      hint: "Class",
      validator: Validator.validateClass,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff2f3f4),
      body: Container(
        color: Colors.transparent,
        //height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Student\nRegistration",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                              color: heading),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: _nameField,
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: _emailField,
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: _schoolField,
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            child: _classField,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            child: _sectionField,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: DropdownButton<String>(
                        onChanged: (s) {
                          setState(() {
                            gender = s;
                          });
                        },
                        elevation: 0,
                        value: gender,
                        style: TextStyle(
                            fontSize: 22,
                            color: main_blue,
                            fontWeight: FontWeight.w500),
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "MALE",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: heading,
                                  fontWeight: FontWeight.w500),
                            ),
                            value: "MALE",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "FEMALE",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: heading,
                                  fontWeight: FontWeight.w500),
                            ),
                            value: "FEMALE",
                          ),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    splashColor: Colors.white.withOpacity(0.1),
                    color: heading,
                    onPressed: () {
                      _register();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 22,
                            color: Color(0xfff2f3f4),
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    splashColor: Colors.white.withOpacity(0.1),
                    color: heading,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowUserList()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        "Show All Registered Students ->",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xfff2f3f4),
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _register() {
    print("clicked register");
    User _user;
    if (Validator.validateName(_fullname.text) &&
        Validator.validateEmail(_email.text) &&
        Validator.validateName(_school.text) &&
        Validator.validateClass(_class.text) &&
        Validator.validatesection(_section.text)) {
      _user = User(
          firstName: _fullname.text,
          email: _email.text,
          school: _school.text,
          classstuding: _class.text,
          section: _section.text,
          gender: gender);
      showDialog(
        barrierDismissible: false,
        context: context,
        child: CustomLoadingDialog(),
      );
      Auth.addUser(_user, context);
    } else {
      showCupertinoModalPopup(
          context: context,
          builder: (_) {
            return Material(
              type: MaterialType.transparency,
              //padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width,
                  child:
                      Center(child: Text("Please fill all the details correctly",style: TextStyle(color: Colors.redAccent,fontSize: 22),)),
                ),
              ),
            );
          });
    }
  }
}
