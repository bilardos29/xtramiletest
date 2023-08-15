import 'package:flutter/material.dart';
import 'package:xtramilemobiletest/models/movie_model.dart';
import 'package:xtramilemobiletest/utils/color.dart';
import 'package:xtramilemobiletest/widgets/movie_card_big_widget.dart';

import '../../widgets/bottom_menu_widget.dart';
import '../../widgets/header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.skate.shade200,
      bottomNavigationBar: const BottomMenuWidget(),
      body: SafeArea(
        child: Stack(children: [
          ListView(
            children: [
              const HeaderWidget(name: 'Visitor'),
              Container(
                height: 300,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    MovieCardBig(
                        model: MovieModel(
                            title: "Love Story",
                            posterPath: "imgmovie1.png",
                            voteAverage: 4.8)),
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
            ],
          ),
        ]),
      ),
    );
  }
}
