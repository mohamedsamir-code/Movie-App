import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/MyTheme.dart';
import 'package:movie_app/details/move_details_viewModel.dart';
import 'package:movie_app/firebase_utils.dart';
import 'package:movie_app/model/Image_Stack.dart';
import 'package:movie_app/model/PopularResponse.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const String routeName = 'movie_details';
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailsViewModel viewModel = MovieDetailsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as int;
    Results results = Results();
    viewModel.getDetails(args);
    viewModel.getSimilar(args);

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<MovieDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.movie == null) {
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.yellowColor,
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Color(0xFF1D1E1D),
                centerTitle: true,
                title: Text('${viewModel.movie?.title}'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w500/${viewModel.movie?.backdropPath}',
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      viewModel.movie!.title!,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${viewModel.movie!.releaseDate}   ${viewModel.movie!.runtime} mins',
                      style: TextStyle(color: MyTheme.silverColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ImageStack(
                            movie: results,
                            imagePath:
                            'https://image.tmdb.org/t/p/w500/${viewModel.movie?.posterPath}'),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8) ,
                                child: Text(
                                  '${viewModel.movie!.overview}',
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, color: MyTheme.yellowColor, size: 18,),
                                  Text('${viewModel.movie!.voteAverage}',style: TextStyle(color: Colors.white, fontSize: 18) ,),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      color: Color(0xFF282A28),
                      child:
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        Text(
                          'Similar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Consumer<MovieDetailsViewModel>(
                          builder: (context, viewModel, child){
                            if(viewModel.errorMsg != null){
                              return Center(
                                child: Column(
                                  children: [
                                    Text(viewModel.errorMsg ?? ''),
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {});
                                        },
                                        child: Text('Try Again'))
                                  ],
                                ),
                              );
                            }else if (viewModel.similarMovies == null) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: MyTheme.yellowColor,
                                ),
                              );
                            }
                            return ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: MediaQuery.of(context).size.height/4,
                              ),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: viewModel.similarMovies!.length,
                                  itemBuilder: (context,index){
                                    return Container(
                                        margin: EdgeInsets.symmetric(horizontal: 5),
                                        padding: EdgeInsets.all(5),
                                        child: ImageStack(movie:viewModel.similarMovies![index],imagePath: 'https://image.tmdb.org/t/p/w500/${viewModel.similarMovies?[index].posterPath}')
                                    );
                                  }
                              ),
                            );
                          },
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}