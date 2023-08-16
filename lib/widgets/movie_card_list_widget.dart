import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/movie_model.dart';

class MovieCardListWidget extends StatelessWidget {
  final MovieModel model;
  final VoidCallback? onClick;

  const MovieCardListWidget({required this.model, this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick ?? () {},
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('${model.posterPath}'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.title ?? "",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: model.voteAverage ?? 0,
                          itemBuilder: (context, index) =>
                              const Icon(Icons.star, color: Colors.deepOrange),
                          itemCount: 5,
                          itemSize: 16.0,
                          unratedColor: Colors.deepOrange.withAlpha(90),
                          direction: Axis.horizontal,
                        ),
                        const SizedBox(width: 8),
                        Text("${model.voteAverage ?? ""}",
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 14)),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
