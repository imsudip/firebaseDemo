import 'package:flutter/material.dart';

//import 'package:student_registration/ui/widgets/colors.dart';
class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Color baseColor;
  final Color borderColor;
  final Color errorColor;
  final TextInputType inputType;
  final bool obscureText;
  final Function validator;
  final Function onChanged;
  IconData icon;
  CustomTextField(
      {this.hint,
      this.controller,
      this.onChanged,
      this.baseColor,
      this.borderColor,
      this.errorColor,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      this.validator,
      this.icon = Icons.warning});

  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Color currentColor;
 Color iconColor;
  @override
  void initState() {
    super.initState();
    currentColor = widget.borderColor;
   iconColor = Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
   
        return Card(
          elevation: 1.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: currentColor, width: 1.0),
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: TextField(
                    
                    obscureText: widget.obscureText,
                    onChanged: (text) {
                      if (widget.onChanged != null) {
                        widget.onChanged(text);
                      }
                      setState(() {
                        if (!widget.validator(text) || text.length == 0) {
                          currentColor = widget.errorColor;
                          iconColor=widget.errorColor;
                          widget.icon=Icons.highlight_off;
                        } else {
                          currentColor = widget.borderColor;
                          widget.icon=Icons.done;
                          iconColor=Colors.green[400];
                        }
                      });
                    },
                    //keyboardType: widget.inputType,
                    controller: widget.controller,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: widget.baseColor,
                        fontWeight: FontWeight.w300,
                      ),
                      border: InputBorder.none,
                      hintText: widget.hint,
                    ),
                  ),
                ),
                Icon(
                  widget.icon,
                  color: iconColor,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}
