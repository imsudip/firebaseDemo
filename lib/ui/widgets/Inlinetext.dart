import 'package:flutter/material.dart';

class InlineDesc extends StatelessWidget {
  var data;

  String title;

  InlineDesc(this.title, this.data);
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Text(title+"\n",
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.w800)),
            ),
            Flexible(
              flex: 1,
              child: Text(data.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ));
  }
}
