import 'package:flutter/material.dart';
import 'package:movie_app/MyTheme.dart';
import 'package:movie_app/model/Image_Stack.dart';
import '../model/PopularResponse.dart';

class MovieItemCarouselWidget extends StatelessWidget {
  Results movie;
  MovieItemCarouselWidget({required this.movie});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Container(
      height: height/3,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
            fit:BoxFit.fitWidth,width: width,),
          Positioned(
            top: height/6,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                      child: ImageStack(movie:movie,imagePath: 'https://image.tmdb.org/t/p/w500/${movie.posterPath}')),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text('${movie.title!}',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Text(movie.releaseDate! , style: TextStyle(color: MyTheme.silverColor,fontSize: 12),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );



  }
}
