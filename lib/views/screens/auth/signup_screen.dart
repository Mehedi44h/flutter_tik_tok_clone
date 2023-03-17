import 'package:flutter/material.dart';
import 'package:tik_tok_clone/constant.dart';
import 'package:tik_tok_clone/home.dart';
import 'package:tik_tok_clone/views/screens/auth/login_screen.dart';
import 'package:tik_tok_clone/views/screens/home_screen.dart';
import 'package:tik_tok_clone/views/widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();

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
            'Register',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Stack(children: [
            CircleAvatar(
              radius: 64,
              backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/id/1209654046/vector/user-avatar-profile-icon-black-vector-illustration.jpg?s=612x612&w=0&k=20&c=EOYXACjtZmZQ5IsZ0UUp1iNmZ9q2xl1BD1VvN6tZ2UI='),
            ),
            Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                    onPressed: () {
                      authController.pickImage();
                    },
                    icon: Icon(
                      Icons.add_a_photo_outlined,
                    )))
          ]),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              labeltext: 'Username',
              controller: _usernamecontroller,
              icon: Icons.person,
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
                authController.registerUser(
                    _usernamecontroller.text,
                    _emailcontroller.text,
                    _passwordcontroller.text,
                    authController.profilePhoto);
              },
              child: Center(
                child: Text(
                  'Register',
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
              Text("Already have an account?"),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);
                },
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeScreen(),),
                        (route) => false);
                  },
                  child: Text(
                    " Login",
                    style: TextStyle(
                      color: buttonColor,
                      fontSize: 20,
                    ),
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
