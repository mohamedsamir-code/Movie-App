import 'package:flutter/material.dart';
import 'package:movie_app/MyTheme.dart';
import 'package:movie_app/category/category_films_screen.dart';
import 'package:movie_app/category/category_screen.dart';
import 'package:movie_app/details/movie_details_screen.dart';
import 'package:movie_app/home/home_Screen.dart';
import 'package:movie_app/home/home_screen_body.dart';
import 'package:movie_app/search/search_screen.dart';
import 'package:movie_app/splash/splash.dart';
import 'package:movie_app/watchlist/watchlist_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MyApp());
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: MyTheme.appTheme,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        HomeScreenBody.routeName : (context) => HomeScreenBody(),
        SearchScreen.routeName : (context) => SearchScreen(),
        CategoryScreen.routeName : (context) => CategoryScreen(),
        WatchlistScreen.routeName : (context) => WatchlistScreen(),
        MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
        CategoryFilmsScreen.routeName: (context) => CategoryFilmsScreen(),
        Splash.routeName: (context) => Splash(),
      },
      initialRoute: Splash.routeName,


    );
  }
}
