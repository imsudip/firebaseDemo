import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:student_registration/ui/widgets/strings.dart';
class CustomLoadingDialog extends StatefulWidget {
  CustomLoadingDialog({Key key}) : super(key: key);

  _CustomLoadingDialogState createState() => _CustomLoadingDialogState();
}

class _CustomLoadingDialogState extends State<CustomLoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: Colors.white.withOpacity(0.8),
                  height: 100,
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: SpinKitCubeGrid(
                          size: 60,
                          color: main_blue,
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}