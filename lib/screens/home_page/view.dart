import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtramilemobiletest/models/movie_model.dart';
import 'package:xtramilemobiletest/screens/detail_movie/controller.dart';
import 'package:xtramilemobiletest/screens/detail_movie/view.dart';
import 'package:xtramilemobiletest/widgets/movie_card_big_widget.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/headline_widget.dart';
import '../../widgets/movie_card_list_widget.dart';
import 'controller.dart';

class HomePage extends StatefulWidget {
  final String url;
  const HomePage({this.url = 'https://youtube.com', Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;
  late DetailMovieController detailMovieController;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<HomeController>(context);
    detailMovieController = Provider.of<DetailMovieController>(context);
    controller.getListMovieUpcoming();
    controller.getListMovieNowPlaying();
    return Stack(children: [
      ListView(
        children: [
          const SizedBox(height: 12),
          const HeaderWidget(name: 'Visitor'),
          const SizedBox(height: 8),
          const HeadlineWidget(headline: "Upcoming"),
          SizedBox(
              height: 300,
              child: controller.listMovieUpcoming.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listMovieUpcoming.length,
                      itemBuilder: (ctx, idx) {
                        MovieModel model = controller
                            .converDataModel(controller.listMovieUpcoming[idx]);
                        return MovieCardBig(
                            model: MovieModel(
                                title: model.title,
                                posterPath: model.posterPath,
                                voteAverage: model.voteAverage),
                            onClick: () {
                              detailMovieController.getListReview(
                                  movieId: model.id ?? 0,
                                  onSuccess: () {
                                    detailMovieController.getDetailMovie(
                                        movieId: model.id ?? 0,
                                        onSuccess: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailMoviePage(
                                                          movieId:
                                                              model.id ?? 0)));
                                        });
                                  });
                            });
                      })
                  : const SizedBox()),
          const SizedBox(height: 8),
          const HeadlineWidget(headline: "Now Playing", isSingleLine: true),
          controller.listMovieNowPlaying.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.listMovieNowPlaying.length,
                  itemBuilder: (ctx, idx) {
                    MovieModel model = controller
                        .converDataModel(controller.listMovieUpcoming[idx]);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: MovieCardListWidget(
                        model: MovieModel(
                            title: model.title,
                            posterPath: model.posterPath,
                            voteAverage: model.voteAverage),
                        onClick: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailMoviePage(movieId: model.id ?? 0)));
                        },
                      ),
                    );
                  })
              : SizedBox()
        ],
      ),
    ]);
  }
}
