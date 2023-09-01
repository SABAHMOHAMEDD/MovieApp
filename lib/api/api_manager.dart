import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movie_app/home/popular_now/PopularNow.dart';
import 'package:movie_app/search/SearchMovie.dart';

import '../home/top_rated/TopRatedMovies.dart';

class ApiManager {
  static const String Base_Url = 'themoviedb.org';
  static const String apiKey = 'd10fc04d0a98b21ee41861483aeb84b4';

  static Future<PopularNow> getPopularNow() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=76a5d02696258c7bb9f8379068beb9cb&language=en-US&page=1'),
    );

    var responseBody = response.body;
    var json = jsonDecode(responseBody);

    var popularResponse = PopularNow.fromJson(json);
    if (response.statusCode == 200) {
      return popularResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<SearchMovie> getSearch(String params) async {
    var uri = Uri.https(
        Base_Url, '/3/search/movie', {"apiKey": apiKey, "query": params});
    var response = await http.get(uri);

    var responseBody = response.body;
    var json = jsonDecode(responseBody);

    var SearchResponse = SearchMovie.fromJson(json);
    if (response.statusCode == 200) {
      return SearchResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<TopRatedMovies> getTopRated() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=d10fc04d0a98b21ee41861483aeb84b4&language=en-US&page=1'),
    );

    var responseBody = response.body;
    var json = jsonDecode(responseBody);

    var topRatedResponse = TopRatedMovies.fromJson(json);
    if (response.statusCode == 200) {
      return topRatedResponse;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
