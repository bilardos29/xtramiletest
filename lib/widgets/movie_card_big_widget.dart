import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:xtramilemobiletest/models/movie_model.dart';

class MovieCardBig extends StatelessWidget {
  final MovieModel model;
  final VoidCallback? onClick;

  const MovieCardBig(
      {required this.model, this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick ?? () {},
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.black12,
            image: DecorationImage(
                    image: NetworkImage('${model.posterPath}'),
                    fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MovieCardDetail(
                title: model.title ?? "", rate: model.voteAverage ?? 0),
          ],
        ),
      ),
    );
  }
}

class MovieCardDetail extends StatelessWidget {
  final String title;
  final double rate;

  const MovieCardDetail({required this.title, required this.rate, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12))),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          RatingBarIndicator(
            rating: rate,
            itemBuilder: (context, index) =>
                const Icon(Icons.star, color: Colors.deepOrange),
            itemCount: 5,
            itemSize: 16.0,
            unratedColor: Colors.deepOrange.withAlpha(90),
            direction: Axis.horizontal,
          )
        ],
      ),
    );
  }
}
