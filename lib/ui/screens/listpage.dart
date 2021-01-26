import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:student_registration/business/auth.dart';
import 'package:student_registration/ui/screens/detailspage.dart';
import 'package:student_registration/ui/widgets/custom_loading.dart';
import 'package:student_registration/ui/widgets/strings.dart';

class ShowUserList extends StatefulWidget {
  ShowUserList({Key key}) : super(key: key);

  _ShowUserListState createState() => _ShowUserListState();
}

class _ShowUserListState extends State<ShowUserList> {
  var _data;
  @override
  void initState() {
    _data = Auth.getUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RandomColor rn= RandomColor();
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: heading,
        title: Text(
          "All Registered Students",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xfff2f3f4),
      body: Container(
        child: FutureBuilder(
          future: _data,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLoadingDialog();
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(profileData: snapshot.data[index],)));
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 18),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 18,
                    ),
                    leading:  Icon(
                      CupertinoIcons.person_solid,
                      color: rn.randomColor(colorBrightness: ColorBrightness.dark),
                      size: 50,
                    ),
                    subtitle: Text(" -"+
                        snapshot.data[index].data['firstName'].toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54)),
                    title: Text(
                      snapshot.data[index].data['email'].toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
