/// adult : false
/// backdrop_path : "/s3TBrRGB1iav7gFOCNx3H31MoES.jpg"
/// belongs_to_collection : null
/// budget : 160000000
/// genres : [{"id":28,"name":"Action"},{"id":878,"name":"Science Fiction"},{"id":12,"name":"Adventure"}]
/// homepage : "https://www.warnerbros.com/movies/inception"
/// id : 27205
/// imdb_id : "tt1375666"
/// original_language : "en"
/// original_title : "Inception"
/// overview : "Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: \"inception\", the implantation of another person's idea into a target's subconscious."
/// popularity : 90.173
/// poster_path : "/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg"
/// production_companies : [{"id":923,"logo_path":"/5UQsZrfbfG2dYJbx8DxfoTr2Bvu.png","name":"Legendary Pictures","origin_country":"US"},{"id":9996,"logo_path":"/3tvBqYsBhxWeHlu62SIJ1el93O7.png","name":"Syncopy","origin_country":"GB"},{"id":174,"logo_path":"/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png","name":"Warner Bros. Pictures","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"GB","name":"United Kingdom"},{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "2010-07-15"
/// revenue : 825532764
/// runtime : 148
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"},{"english_name":"French","iso_639_1":"fr","name":"Français"},{"english_name":"Japanese","iso_639_1":"ja","name":"日本語"},{"english_name":"Swahili","iso_639_1":"sw","name":"Kiswahili"}]
/// status : "Released"
/// tagline : "Your mind is the scene of the crime."
/// title : "Inception"
/// video : false
/// vote_average : 8.362
/// vote_count : 33923

class MovieDetails {
  MovieDetails({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.status_message,
    this.success,
    this.status_code,
  });

  MovieDetails.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    status_code = json['status_code'];
    success = json['success'];
    status_message = json['status_message'];
  }
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? status_code;
  String? status_message;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] =
          productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] =
          productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] =
          spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"

class SpokenLanguages {
  SpokenLanguages({
    this.englishName,
    this.iso6391,
    this.name,
  });

  SpokenLanguages.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }
  String? englishName;
  String? iso6391;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = englishName;
    map['iso_639_1'] = iso6391;
    map['name'] = name;
    return map;
  }
}

/// iso_3166_1 : "GB"
/// name : "United Kingdom"

class ProductionCountries {
  ProductionCountries({
    this.iso31661,
    this.name,
  });

  ProductionCountries.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }
  String? iso31661;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    return map;
  }
}

/// id : 923
/// logo_path : "/5UQsZrfbfG2dYJbx8DxfoTr2Bvu.png"
/// name : "Legendary Pictures"
/// origin_country : "US"

class ProductionCompanies {
  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  ProductionCompanies.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo_path'] = logoPath;
    map['name'] = name;
    map['origin_country'] = originCountry;
    return map;
  }
}

/// id : 28
/// name : "Action"

class Genres {
  Genres({
    this.id,
    this.name,
  });

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
