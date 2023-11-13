import 'package:flutter/material.dart';
import 'package:movie_app/MyTheme.dart';
import 'package:movie_app/category/category_screen_viewModel.dart';
import 'package:movie_app/category/genreStack.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'category_films_screen.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeName = 'category_screen';

  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryScreenViewModel viewModel = CategoryScreenViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    List<Image> brwoser_Images = [
      Image(
        fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/iiXliCeykkzmJ0Eg9RYJ7F2CWSz.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(
        fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(
        fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/55Rb9qt3yzyF4KQpC1c3T3Fbcao.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(
        fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/iIkogEFPujTQT2A35jG5Q5A7chv.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(
        fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/CyM5FBycEDeIDZi22EkM67ByNy.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(
        fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/w2nFc2Rsm93PDkvjY4LTn17ePO0.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(
        fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/c0MTj7GxwuBujjSsdRQ9i1OstLl.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(
        fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/mQLVpcaVBqiAbKK2MGawCtIwFW0.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(
        fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/bzKzDqV7m8MLWN7G4oZdgIFDHxf.jpg"}"),
        width: 150,
        height: 200,
      ),
      Image(
        fit: BoxFit.fill,
        image: NetworkImage(
            "${Constants.Image_Url}${"/9m161GawbY3cWxe6txd1NOHTjd0.jpg"}"),
        width: 150,
        height: 200,
      ),
    ];
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryScreenViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.genresList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.yellowColor,
              ),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, CategoryFilmsScreen.routeName,
                          arguments: '${viewModel.genresList![index].id}');
                    },
                    child: Stack(children: [
                      Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(13),
                          child: brwoser_Images[index]),
                      GenreStack(genre: viewModel.genresList![index])
                    ]));
              },
              itemCount: 10,
            );
          }
        },
      ),
    );
  }
}
