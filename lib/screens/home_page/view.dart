import 'package:flutter/material.dart';
import 'package:xtramilemobiletest/models/movie_model.dart';
import 'package:xtramilemobiletest/screens/detail_movie/view.dart';
import 'package:xtramilemobiletest/widgets/movie_card_big_widget.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/headline_widget.dart';
import '../../widgets/movie_card_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(
        children: [
          const SizedBox(height: 12),
          const HeaderWidget(name: 'Visitor'),
          const SizedBox(height: 8),
          const HeadlineWidget(headline: "Recommendation"),
          SizedBox(
            height: 300,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                MovieCardBig(
                    model: MovieModel(
                        title: "Love Story",
                        posterPath: "imgmovie1.png",
                        voteAverage: 4.8),
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMoviePage()),
                      );
                    }),
                MovieCardBig(
                    model: MovieModel(
                        title: "Wood Hounting",
                        posterPath: "imgmovie2.png",
                        voteAverage: 4.3)),
                MovieCardBig(
                    model: MovieModel(
                        title: "Wood Hounting 2",
                        posterPath: "imgmovie2.png",
                        voteAverage: 3.5))
              ],
            ),
          ),
          const SizedBox(height: 8),
          const HeadlineWidget(headline: "New Movies", isSingleLine: true),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (index, context) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: MovieCardListWidget(
                    model: MovieModel(
                        title: "Wood Hounting",
                        posterPath: "imgmovie1.png",
                        voteAverage: 3.5),
                  ),
                );
              })
        ],
      ),
    ]);
  }
}
