import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/model/PopularResponse.dart';

CollectionReference<Results> getWatchlistCollection() {
  return FirebaseFirestore.instance
      .collection('watchlist')
      .withConverter<Results>(
          fromFirestore: (snapshot, options) =>
              Results.fromJson(snapshot.data()!),
          toFirestore: (Results, options) => Results.toJson());
}

Future<void> addMovieToWatchlistFireStore(Results movie) {
  var watchlistCollection = getWatchlistCollection();
  var docRef = watchlistCollection.doc('${movie.id}');
  return docRef.set(movie);
}




Future<List<Results>> getAllWatchlistMovies() async {
  QuerySnapshot<Results> querySnapshot = await getWatchlistCollection().get();
  List<Results> movies = querySnapshot.docs.map((doc) {
    return doc.data();
  }).toList();
  return movies;
}