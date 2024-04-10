import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:termproject/page/homepage.dart';
import 'package:termproject/page/vdomovie.dart';

class DataMovie extends StatefulWidget {
  final String? name;
  final String? year;
  final String? synopsis;
  final String? Lengthofmovie;
  final String? review;
  final String? image;
  final String? director;
  final String? actor;

  const DataMovie({
    super.key,
    required this.name,
    required this.year,
    required this.synopsis,
    required this.Lengthofmovie,
    required this.review,
    required this.image,
    required this.director,
    required this.actor,
  });

  @override
  State<DataMovie> createState() => _DataMovieState();
}

class _DataMovieState extends State<DataMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomePage(),
              ),
            );
          },
        ),
        title: Center(
          child: Image.asset(
            'asstes/images/icon.png',
            height: 50,
            width: 50,
          ),
        ),
        backgroundColor: Color(0xFFB71C1C),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.image!), fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 5.0),
                      child: Image.network(
                        widget.image!,
                        height: 350,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 600,
                      width: 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        color: Color(0xFF212121),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10.0, 15.0, 0, 0),
                              child: Text(
                                widget.name!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
                              child: Text(
                                'Time : ${widget.Lengthofmovie}',
                                style: TextStyle(
                                  color: Color(0xff777676),
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
                              child: Text(
                                'Year : ${widget.year}',
                                style: TextStyle(
                                  color: Color(0xff777676),
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star, color: Color(0xfffbc100)),
                                  Text(
                                    ' ${widget.review!}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Synopsis ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 5.0, 10, 0),
                                    child: Text(
                                      '${widget.synopsis!}',
                                      style: TextStyle(
                                          color: Color(0xff777676),
                                          fontSize: 15.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Director',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Center(
                                  child: Text(
                                    '${widget.director!}',
                                    style: TextStyle(
                                        color: Color(0xff777676),
                                        fontSize: 15.0),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Actor',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 0, 20.0, 0),
                                  child: Text(
                                    '${widget.actor}',
                                    style: TextStyle(
                                      color: Color(0xff777676),
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFB71C1C),
        height: 70.0,
        child: Material(
          color: Color(0xFF212121),
          borderRadius: BorderRadius.circular(16),
          elevation: 4.0,
          child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const VdoMovie(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'WATCH',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
