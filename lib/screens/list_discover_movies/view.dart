import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/movie_model.dart';
import '../../widgets/movie_card_list_widget.dart';
import '../detail_movie/view.dart';
import 'controller.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  late DiscoverController controller;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<DiscoverController>(context);
    controller.getListMovieDiscover();
    return controller.listDiscover.isNotEmpty
        ? RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                Duration(seconds: 1),
                () {
                  controller.incrementPage();
                  controller.getListMovieDiscover();
                },
              );
            },
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: controller.listDiscover.length,
                itemBuilder: (ctx, idx) {
                  MovieModel model =
                      MovieModel.fromJson(controller.listDiscover[idx]);
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
                }),
          )
        : SizedBox();
  }
}
