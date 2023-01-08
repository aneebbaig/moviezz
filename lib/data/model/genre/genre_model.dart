
import 'genres_list.dart';

class Genre {
  Genre({
      this.genres,});

  Genre.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(GenresList.fromJson(v));
      });
    }
  }
  List<GenresList>? genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}