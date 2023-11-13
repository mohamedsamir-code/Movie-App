import 'package:flutter/material.dart';
import 'package:movie_app/category/category_films_screen.dart';
import '../model/GenresResponse.dart';

class GenreStack extends StatelessWidget {
  Genres genre;
  GenreStack({required this.genre});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('${genre.name}',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),);
    //   Container(
    //   margin: EdgeInsets.all(8),
    //   child: Stack(
    //     alignment: Alignment.center,
    //     children: [
    //       //Image.asset('assets/images/films.jpg',fit: BoxFit.fill,),
    //       Text('${genre.name}',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),)
    //
    //     ],
    //   ),
    // );
  }
}
