import 'package:flutter/material.dart';
import 'package:movie_app/category/category_film_viewModel.dart';
import 'package:movie_app/model/movie_card.dart';
import 'package:provider/provider.dart';
import '../MyTheme.dart';

class CategoryFilmsScreen extends StatefulWidget {
  static const String routeName = 'category_film_screen';

  const CategoryFilmsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryFilmsScreen> createState() => _CategoryFilmsScreenState();
}

class _CategoryFilmsScreenState extends State<CategoryFilmsScreen> {
  CategoryFilmsViewModel viewModel = CategoryFilmsViewModel();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    viewModel.getMoviesByGenres(args);
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryFilmsViewModel>(
          builder: (context, viewModel, child) {
             if(viewModel.results == null){
              return Center(
                child: CircularProgressIndicator(
                  color: MyTheme.yellowColor,
                ),
              );
            }
            else{
               return Material(
                 color: Colors.black,
                 child: Expanded(
                   child: ListView.builder(
                     shrinkWrap: true,
                     itemBuilder: (context, index) {
                       return MovieCard(movie: viewModel.results![index]);
                     },
                     itemCount: viewModel.results!.length,
                   ),
                 ),
               );

             }
          },
        ));
  }
}
