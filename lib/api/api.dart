import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_browser/constant/constant.dart';
import 'package:movie_browser/model/movie.dart';

class Api {
  static String topUrl = 'https://api.themoviedb.org/3/trending/movie/day?language=en-USapi_keys=${Constant.apikey}';
  static String upUrl =  'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constant.apikey}&language=en-US&page=1';
  static String rateUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constant.apikey}&language =en-US&page=1';
  


  static Map<String, String> header = {
    'Authorization': 'Bearer ${Constant.accesstoken}',
    'Content-Type': 'application/json'
  };

  static Future<List<Movie>> getMovie() async {
    try{
      final response = await http.get(Uri.parse(Api.topUrl), headers: header);
      if (response.statusCode == 200) {
        final decodeData = json.decode(response.body)["results"] as List<dynamic>;
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
        } else {
          debugPrint("May here yes");
          throw Exception("Unexpected Response from the server");
          }
          } on SocketException catch (_){
            throw Exception("No internet connection");
            }catch (e){
              throw Exception("Failed to load movies");
        }
    }

  static Future<List<Movie>> getUpcomingMovies() async {
    try{
      final response = await http.get(Uri.parse(Api.upUrl), headers: header);
      if (response.statusCode == 200) {
        final decodeData = json.decode(response.body)["results"] as List<dynamic>;
        debugPrint(decodeData.toString());

        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        debugPrint("May here yes");
        throw Exception("Unexpected Response from the server");
      }
    }on SocketException catch (_){
      throw Exception('No internet connection');
    }catch (e){
      throw Exception('Failed to load movies');
    }
  }

  static Future<List<Movie>> getTopRatedMovies() async {
    try{
      final response = await http.get(Uri.parse(rateUrl), headers: header);
      if(response.statusCode == 200){
        final decodeData = json.decode(response.body)['results'] as List<dynamic>;
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    }
      else{
        debugPrint("May here yes");
        throw Exception("Unexpected Response from the server");
    }
  } on SocketException catch (_){
    throw Exception('No Internet connection');
  } catch (e){
    throw Exception('Failed to load movies');
  }
  }
}
