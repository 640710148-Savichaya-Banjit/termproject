//import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:termproject/page/homepage.dart';
//import 'package:termproject/services/api_caller.dart';
//import 'package:termproject/services/storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  //
  Map data = {
    'email': 'user01@gmail.com',
    'username': 'user01',
    'password': '123456',
    'phone': '0933333333',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'asstes/images/backgroud_login.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              height: 120,
              width: 120,
              child: Image.asset('asstes/images/icon.png'),
            ),
            Text(
              "Big Cinema",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    height: 60.0,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey[600]?.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        border: InputBorder.none,
                        hintText: 'Email',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Icon(Icons.email, color: Colors.white),
                        ),
                        hintStyle:
                            TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    height: 60.0,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey[600]?.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        border: InputBorder.none,
                        hintText: 'PassWord',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Icon(Icons.lock, color: Colors.white),
                        ),
                        hintStyle:
                            TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      obscureText: true,
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Material(
              color: Color(0xff870909),
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                onTap: () {
                  if (_emailController.text == data['email'] &&
                      _passwordController.text == data['password']) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomePage(),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Invalid email or password'),
                          actions: [
                            TextButton(
                              child: const Text('YES'),
                              onPressed: () => Navigator.of(context).pop(),
                            )
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  height: 50.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
