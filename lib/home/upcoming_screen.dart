import 'package:flutter/material.dart';
import 'package:movie_app/MyTheme.dart';
import 'package:movie_app/home/top_rated_viewModel.dart';
import 'package:movie_app/home/upcoming_viewModel.dart';
import 'package:movie_app/home/upcoming_viewModel.dart';
import 'package:movie_app/home/upcoming_viewModel.dart';
import 'package:movie_app/model/Image_Stack.dart';
import 'package:provider/provider.dart';

class UpComingScreen extends StatefulWidget {
  UpComingScreen({Key? key}) : super(key: key);

  @override
  State<UpComingScreen> createState() => _UpComingScreenState();
}

class _UpComingScreenState extends State<UpComingScreen> {
  UpcomingViewModel viewModel = UpcomingViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => viewModel,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          padding: EdgeInsets.all(8),
          color: Color(0xFF282A28),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              'Recommended'
                  '',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Consumer<UpcomingViewModel>(
              builder: (context, viewModel, child){
                if (viewModel.upcomingMovies == null) {
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
                      itemCount: viewModel.upcomingMovies!.length,
                      itemBuilder: (context,index){
                        return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.all(5),
                            child: ImageStack(movie:viewModel.upcomingMovies![index],imagePath: 'https://image.tmdb.org/t/p/w500/${viewModel.upcomingMovies?[index].posterPath}')
                        );
                      }
                  ),
                );
              },
            ),
          ]),
        ));
  }
}
