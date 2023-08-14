import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:xtramilemobiletest/models/movie_model.dart';

class MovieCardBig extends StatelessWidget {
  final MovieModel model;

  const MovieCardBig({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("", fit: BoxFit.fill),
        MovieCardDetail(title: "", detail: "", rate: 0),
      ],
    );
  }
}

class MovieCardDetail extends StatelessWidget {
  final String title;
  final String detail;
  final double rate;

  MovieCardDetail(
      {required this.title, required this.detail, required this.rate, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(title),
              Text(detail),
            ],
          ),
          RatingBarIndicator(
            rating: rate,
            itemBuilder: (context, index) =>
                const Icon(Icons.star, color: Colors.deepOrangeAccent),
            itemCount: 5,
            itemSize: 50.0,
            unratedColor: Colors.amber.withAlpha(50),
            direction: Axis.horizontal,
          )
        ],
      ),
    );
  }
}
