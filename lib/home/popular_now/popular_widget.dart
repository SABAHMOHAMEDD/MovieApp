import 'package:flutter/material.dart';
import 'package:movie_app/home/popular_now/PopularNow.dart';

class PopularWidget extends StatelessWidget {
  Results results;

  PopularWidget(this.results);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500' + '${results?.posterPath}',
            fit: BoxFit.cover,
            width: 130,
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                results.title ?? "",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                results.releaseDate ?? "",
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
