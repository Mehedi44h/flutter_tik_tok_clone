import 'package:flutter/material.dart';
import 'package:tik_tok_clone/constant.dart';
import 'package:tik_tok_clone/home.dart';
import 'package:tik_tok_clone/views/screens/auth/signup_screen.dart';
import 'package:tik_tok_clone/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tiktok Clone',
            style: TextStyle(
              fontSize: 35,
              color: buttonColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'Login',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              labeltext: 'Email',
              controller: _emailcontroller,
              icon: Icons.email,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              labeltext: 'Password',
              controller: _passwordcontroller,
              icon: Icons.lock,
              isObscure: true,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: InkWell(
              onTap: () {
                authController.loginUser(
                    _emailcontroller.text, _passwordcontroller.text);
              },
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                      (route) => false);
                },
                child: Text(
                  " Register",
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
