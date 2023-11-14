import 'package:flutter/material.dart';
import 'package:movie_app/MyTheme.dart';
import 'package:movie_app/home/popular_body_viewModel.dart';
import 'package:movie_app/home/Movie_Item_Carousel_Widget.dart';
import 'package:provider/provider.dart';
class PopularScreen extends StatefulWidget {
  static const String routeName = 'home_body_screen';

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  PopularScreenViewModel viewModel = PopularScreenViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getPopular();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child:  Container(
        child: Consumer<PopularScreenViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.errorMsg != null) {
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
            } else if (viewModel.popularMovies == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: MyTheme.yellowColor,
                ),
              );
            } else {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height/2.3,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MovieItemCarouselWidget(
                      movie: viewModel.popularMovies![index],
                    );
                  },
                  itemCount: viewModel.popularMovies!.length,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}


