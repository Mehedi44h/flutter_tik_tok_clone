import 'package:flutter/material.dart';
import 'package:tik_tok_clone/constant.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller ;
  final String labeltext;
  final bool isObscure;
  final IconData icon;
  TextInputField({Key? key, required this.labeltext,  this.isObscure=false, required this.icon, required this.controller })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labeltext,
        prefixIcon: Icon(icon),
        labelStyle: TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      obscureText: isObscure,
    );
  }
}
