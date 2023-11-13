import 'package:flutter/material.dart';
import 'package:movie_app/MyTheme.dart';
import 'package:movie_app/home/top_rated_viewModel.dart';
import 'package:movie_app/model/Image_Stack.dart';
import 'package:provider/provider.dart';

class TopRatedScreen extends StatefulWidget {
  TopRatedScreen({Key? key}) : super(key: key);

  @override
  State<TopRatedScreen> createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen> {
  TopRatedViewModel viewModel = TopRatedViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getTopRated();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => viewModel,
        child: Container(
          padding: EdgeInsets.all(8),
          color: Color(0xFF282A28),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      Text(
                        'New Releases',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Consumer<TopRatedViewModel>(
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
                          }else if (viewModel.topRatedMovies == null) {
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
                              itemCount: viewModel.topRatedMovies!.length,
                                itemBuilder: (context,index){
                                  return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    padding: EdgeInsets.all(5),
                                    child: ImageStack(movie:viewModel.topRatedMovies![index],imagePath: 'https://image.tmdb.org/t/p/w500/${viewModel.topRatedMovies?[index].posterPath}')
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
