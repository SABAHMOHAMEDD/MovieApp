import 'package:flutter/material.dart';

import 'TopRatedMovies.dart';

class TopRatedWidget extends StatelessWidget {
  TopRatedResults topRatedResults;

  TopRatedWidget(this.topRatedResults);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500' + '${topRatedResults.posterPath}',
            fit: BoxFit.cover,
            width: 130,
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                topRatedResults.voteAverage.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                topRatedResults.title ?? "",
                style: const TextStyle(
                    color: Color(0xFFB5B4B4),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                topRatedResults.releaseDate ?? "",
                style: const TextStyle(
                    color: Color(0xFFB5B4B4),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}
