import 'package:flutter/cupertino.dart';
import 'package:movie_app/home/popular_screen.dart';
import 'package:movie_app/home/top_rated_screen.dart';
import 'package:movie_app/home/upcoming_screen.dart';

class HomeScreenBody extends StatefulWidget {
  static const String routeName = 'home_body_screen';
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            PopularScreen(),
            TopRatedScreen(),
            UpComingScreen()
          ],
        ),
      ),
    );

  }
}
