import 'package:flutter/material.dart';
import 'package:student_registration/ui/widgets/custom_alert_dialog.dart';
class ShowAlertScreen extends StatefulWidget {
  CustomAlertDialog customalertbox;

  ShowAlertScreen({this.customalertbox,Key key}) : super(key: key);

  _ShowAlertScreenState createState() => _ShowAlertScreenState();
}

class _ShowAlertScreenState extends State<ShowAlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width:MediaQuery.of(context).size.width ,
      color: Colors.black.withOpacity(1),
       child: Center(
         child: widget.customalertbox ,
       )
       
    );
  }
}