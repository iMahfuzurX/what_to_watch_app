//
// Created by iMahfuzurX on 1/20/2023.
//
import 'package:flutter/material.dart';
import 'package:what_to_watch/models/movies_model.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Movie> favoriteMovieList;

  FavouriteScreen(this.favoriteMovieList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Expanded(
        child: ListView.builder(
          itemBuilder: (ctx, index) => Card(
            child: ListTile(
              title: Text(favoriteMovieList[index].title),
              subtitle: Text('Year : ${favoriteMovieList[index].year}'),
            ),
          ),
          itemCount: favoriteMovieList.length,
        ),
      ),
    );
  }
}
