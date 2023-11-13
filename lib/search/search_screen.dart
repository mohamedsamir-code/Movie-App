import 'package:flutter/material.dart';
import 'package:movie_app/details/movie_details_screen.dart';
import 'package:movie_app/model/MovieDetails.dart';
import 'package:movie_app/model/movie_card.dart';
import 'package:movie_app/search/search_viewModel.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search_screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchViewModel viewModel = SearchViewModel();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                onChanged: (text){viewModel.searchMovie(searchController.text);}  ,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: 'Search movie',
                    hintStyle: const TextStyle(color: Colors.white)),
                    cursorColor: Colors.white ,
                style: const TextStyle(color: Colors.white), //<-- SEE HERE

              ),
              Consumer<SearchViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.searchedMovies == null) {
                    return const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.local_movies,
                            size: 100,
                            color: Colors.white54,
                          ),
                          Text('No movies found',style: TextStyle(color: Colors.white54,fontSize: 24),)
                        ],
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return MovieCard(movie: viewModel.searchedMovies![index]);
                        },
                        itemCount: viewModel.searchedMovies!.length,
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
