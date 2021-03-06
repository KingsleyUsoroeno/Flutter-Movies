import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:movies/movies/Result.dart';
import 'package:movies/movies/movies.dart';

class MovieDetail extends StatelessWidget {
  final String imageUrl = 'https://image.tmdb.org/t/p/w500/';
  final Results movie;

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Detail',
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.network(imageUrl + movie.posterPath,
                  fit: BoxFit.cover),
              new BackdropFilter(
                filter: new ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: new Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: new Column(
                  children: <Widget>[
                    Container(
                      child: new Container(width: double.infinity, height: 400.0,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: new DecorationImage(
                              image: NetworkImage(
                                  imageUrl + movie.posterPath),
                              fit: BoxFit.cover)),),
                    ),
                    new Expanded(
                      child: Text(movie.title, style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontFamily: 'Arvo')),
                    ),
                    new Expanded(
                      child: Text(movie.overview, style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Arvo')),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
