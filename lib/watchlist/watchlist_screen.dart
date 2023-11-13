import 'package:flutter/material.dart';
import 'package:movie_app/MyTheme.dart';
import 'package:movie_app/watchlist/watchlist_viewModel.dart';
import 'package:provider/provider.dart';

import '../model/movie_card.dart';

class WatchlistScreen extends StatefulWidget {
  static const String routeName = 'watchlist_screen';

  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  WatchlistViewModel viewModel = WatchlistViewModel();
  @override
  void initState() {
    // TODO: implement initState
    viewModel.getWatchlistMovies();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Column(
          children: [
            Text('Watchlist Movies',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            Consumer<WatchlistViewModel>(
                builder: (context,viewModel,child){
                  if(viewModel.movies == null){
                    return Center(
                      child: CircularProgressIndicator(
                        color: MyTheme.yellowColor,
                      ),
                    );
                  }
                  else{
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          //return null;

                          return MovieCard(movie: viewModel.movies![index],);
                        },
                        itemCount: viewModel.movies!.length,
                      ),
                    );

                  }

                }
            )
          ],
        ),
      ),
    );
  }
}
