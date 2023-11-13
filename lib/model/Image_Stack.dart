import 'package:flutter/material.dart';
import 'package:movie_app/firebase_utils.dart';

import '../details/movie_details_screen.dart';
import 'PopularResponse.dart';

class ImageStack extends StatelessWidget {
  String imagePath;
  Results movie;
  ImageStack({required this.movie,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, MovieDetailsScreen.routeName,arguments:movie.id );
          },
          child: Image.network(
            imagePath,
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width / 3,
            // height: height/4,
          ),
        ),
        IconButton(onPressed: (){
          addMovie(movie,context);
        }, icon: Image.asset('assets/images/bookmark_add.png',scale: 0.3,))
      ],
    );
  }

  void addMovie(Results movie,BuildContext context) {
    addMovieToWatchlistFireStore(movie).timeout(Duration(milliseconds: 500 ),onTimeout: (){showAlertDialog(context);});
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("OK"),
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Film is added to watchlist"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
