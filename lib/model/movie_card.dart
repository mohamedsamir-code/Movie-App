import 'package:flutter/material.dart';
import 'package:movie_app/MyTheme.dart';
import 'package:movie_app/firebase_utils.dart';
import 'package:movie_app/model/Image_Stack.dart';
import '../details/movie_details_screen.dart';
import 'PopularResponse.dart';

class MovieCard extends StatelessWidget {
  Results movie;
  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, MovieDetailsScreen.routeName,arguments:movie.id );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: MyTheme.greyCheckColor, width: 3))),
        child: Row(
          children: [
            Image.network('https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                width: MediaQuery.of(context).size.width / 4),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  Text(
                    movie.releaseDate!,
                    style: TextStyle(
                        color: MyTheme.greyCheckColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: MyTheme.yellowColor,
                      ),
                      Text(
                        '${movie.voteAverage!}',
                        style: TextStyle(
                            color: MyTheme.greyCheckColor,
                            fontSize:  14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
