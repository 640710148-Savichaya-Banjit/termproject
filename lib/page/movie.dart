import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:termproject/page/datamovie.dart';
import 'package:termproject/page/showokDialog.dart';
import 'package:termproject/services/api_caller.dart';

import '../model/listmovie.dart';

class Movie extends StatefulWidget {
  const Movie({super.key});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  List<ListMovie> _listMovie = [];
  @override
  void initState() {
    super.initState();
    _loadlistMovies();
  }

  Future<void> _loadlistMovies() async {
    try {
      final data = await ApiCaller().get("datamovie");
      // ข้อมูลที่ได้จาก API นี้จะเป็น JSON array ดังนั้นต้องใช้ List รับค่าจาก jsonDecode()
      List list = jsonDecode(data);
      setState(() {
        _listMovie = list.map((e) => ListMovie.fromJson(e)).toList();
      });
    } on Exception catch (e) {
      showOkDialog(context: context, title: "Error", message: e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: _listMovie.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3.0,
          mainAxisSpacing: 3.0,
          mainAxisExtent: 300,
        ),
        itemBuilder: (context, index) {
          var listmovies = _listMovie[index];
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Material(
              color: Color(0xff870909),
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DataMovie(
                          name: listmovies.name,
                          year: listmovies.year,
                          synopsis: listmovies.synopsis,
                          Lengthofmovie: listmovies.Lengthofmovie,
                          review: listmovies.review,
                          image: listmovies.image,
                          director: listmovies.director,
                          actor: listmovies.actor),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                        child: Image.network(
                          listmovies.image ?? "no image",
                          height: 170,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                listmovies.name ?? "no name",
                                style: TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow
                                      .ellipsis, // Truncate text if it's too long
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              Text(
                                ' ${listmovies.Lengthofmovie}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(children: [
                            Icon(
                              Icons.star,
                              color: Color(0xffffc400),
                              size: 20.0,
                            ),
                            Text(
                              ' ${listmovies.review}',
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            //),
          );
        },
      ),
    );
  }
}
