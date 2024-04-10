import 'package:flutter/material.dart';
import 'package:termproject/login/loginpage.dart';
import 'package:termproject/page/homepage.dart';

class User extends StatefulWidget {
  const User({
    super.key,
  });

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  Map data = {
    'email': 'user01@gmail.com',
    'username': 'user01',
    'password': '123456',
    'phone': '093-333-3333',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  height: 120,
                  width: 120.0,
                  child: Image.asset('asstes/images/image_user.png'),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.white, size: 20.0),
                      Text(
                        ' ${data['username']}',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.white, size: 20.0),
                      Text(
                        ' ${data['email']}',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.white, size: 20.0),
                      Text(' ${data['phone']}',
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            Material(
              color: Color(0xFFB71C1C),
              borderRadius: BorderRadius.circular(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  );
                },
                child: Container(
                  height: 40.0,
                  width: 200.0,
                  child: Center(
                    child: Text(
                      'Sign Out',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
