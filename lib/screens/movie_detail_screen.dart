//
// Created by iMahfuzurX on 1/20/2023.
//
import 'package:flutter/material.dart';
import 'package:what_to_watch/models/movies_model.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  bool _isFavourite(Movie movie, List<Movie> favouriteMovies) {
    // final Map<String, Object> params = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    // final List<Movie> favouriteMovies = params['favouriteMovies'] as List<Movie>;
    return favouriteMovies.any((element) => element.id == movie.id);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> params = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final Movie movie = params['movie'] as Movie;
    final List<Movie> favouriteMovies = params['favouriteMovies'] as List<Movie>;
    final Function(Movie) toggleFav = params['toggleFav'] as Function(Movie);
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: mediaQuery.padding.top,
          ),
          Container(
            margin: EdgeInsets.all(16),
            height: 100,
            child: FittedBox(
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ),
          Text(
            movie.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            toggleFav(movie);
          });
        },
        child: Icon(_isFavourite(movie, favouriteMovies) ? Icons.favorite:Icons.favorite_border),
      ),
    );
  }
}
