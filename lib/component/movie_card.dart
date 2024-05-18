
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.voteAverage,
    required this.title,
    required this.ratingIcon,
    required this.timeIcon,
    required this.image,
    required this.releaseDate

  });

  final String image;
  final String title;
  final Icon ratingIcon;
  final Icon timeIcon;
  final double voteAverage;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 600,
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              child: Image.network(
                height: 160,
                width: 300,
                image,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //make a conatiner inside with the column its children are the title and row of rating and time
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      itemSize: 10.0,
                      initialRating: voteAverage / 2,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        debugPrint(rating.toString());
                      },
                    ),
                    const Spacer(),
                    timeIcon,
                    const SizedBox(width: 5.0),
                    Text(
                      releaseDate,
                      style: const TextStyle(fontSize: 10.0),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
