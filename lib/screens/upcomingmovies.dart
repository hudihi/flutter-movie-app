import 'package:flutter/material.dart';
import 'package:movie_browser/api/api.dart';
import 'package:movie_browser/component/movie_card.dart';
import 'package:movie_browser/constant/constant.dart';
import 'package:movie_browser/model/movie.dart';

class TabTwo extends StatefulWidget {
  const TabTwo({super.key});

  @override
  State<TabTwo> createState() => _TabTwoState();
}

class _TabTwoState extends State<TabTwo> {

  late Future<List<Movie>> upcomingmovies;

  @override
  void initState(){
    upcomingmovies = Api.getUpcomingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: upcomingmovies,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator() ,
            );
        }
            else if (snapshot.hasError){
              return Text("Error: ${snapshot.error}");
            } else {
              List<Movie>? data = snapshot.data;
              if (data == null || data.isEmpty){
                return const Center(
                  child: Text("No Movie found"),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  itemCount: data.length,
                  itemBuilder: (context, index){
                    return MovieCard(
                      image: '${Constant.imageUrl}${data[index].posterPath}',
                      title: data[index].title,
                      voteAverage: data[index].voteAverage,
                      ratingIcon: const Icon(
                        Icons.star_border_outlined,
                        size: 15.0,
                      ),
                      timeIcon: const Icon(
                        Icons.timer_outlined,
                        size: 15.0,
                      ),
                      releaseDate: data[index].releaseDate,
                    );
                  },
                ),
              );
            }
        }
    );
  }
}
