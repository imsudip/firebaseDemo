import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_registration/ui/widgets/Inlinetext.dart';
import 'package:student_registration/ui/widgets/strings.dart';

class DetailsPage extends StatefulWidget {
  var profileData;

  DetailsPage({Key key, this.profileData}) : super(key: key);

  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var _profiledata = widget.profileData;
    return Scaffold(
      backgroundColor: heading,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: heading,
        title: Text(
          _profiledata.data['firstName'],
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.7,
          width:  MediaQuery.of(context).size.width*0.8,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Icon(CupertinoIcons.person_solid,color: heading,size: 100,),
                ),
                InlineDesc('NAME', _profiledata.data['firstName']),
                InlineDesc('EMAIL', _profiledata.data['email']),
                InlineDesc('SCHOOL', _profiledata.data['school']),
                InlineDesc('CLASS', _profiledata.data['class']),
                InlineDesc('SECTION', _profiledata.data['section']),
                InlineDesc('GENDER', _profiledata.data['gender']),
                InlineDesc('TIMESTAMP', _profiledata.data['registration time stamp']),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
