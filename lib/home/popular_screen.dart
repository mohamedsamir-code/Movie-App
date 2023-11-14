import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/MyTheme.dart';
import 'package:movie_app/home/popular_body_viewModel.dart';
import 'package:movie_app/home/Movie_Item_Carousel_Widget.dart';
import 'package:provider/provider.dart';
class PopularScreen extends StatefulWidget {
  static const String routeName = 'home_body_screen';
  CarouselController buttonCarouselController = CarouselController();

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
      child: CarouselSlider.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Container(
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
        carouselController: widget.buttonCarouselController,
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}


