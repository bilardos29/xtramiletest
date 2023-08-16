import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtramilemobiletest/screens/youtube/view.dart';
import 'package:xtramilemobiletest/widgets/headline_widget.dart';
import 'package:xtramilemobiletest/widgets/user_review_widget.dart';

import '../../models/review_model.dart';
import '../../utils/date_converter.dart';
import 'controller.dart';

class DetailMoviePage extends StatefulWidget {
  final int movieId;

  const DetailMoviePage({required this.movieId, Key? key}) : super(key: key);

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  late DetailMovieController controller;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<DetailMovieController>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.8,
              child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            controller.model.backdropPath ?? "",
                          ),
                          fit: BoxFit.cover))),
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.arrow_back,
                                    size: 24, color: Colors.white),
                              ),
                              const Icon(Icons.favorite_border,
                                  size: 24, color: Colors.white),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        controller.model.posterPath ?? "",
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const YoutubePage()));
                                },
                                child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        color: Colors.white),
                                    child: const Icon(Icons.play_circle,
                                        size: 60, color: Colors.red))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Text('${controller.model.title}',
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Text('${controller.model.overview}',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black)),
                      ),
                      const SizedBox(height: 12),
                      const Divider(height: 1),
                      const SizedBox(height: 4),
                      const HeadlineWidget(
                          headline: "User Reviews", isSingleLine: true),
                      const SizedBox(height: 4),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.listReview.length,
                          itemBuilder: (ctx, idx) {
                            ReviewModel model = ReviewModel.fromJson(
                                controller.listReview[idx]);
                            return UserReviewWidget(
                                imgProfile:
                                    model.authorDetails!.avatarPath ?? "",
                                name: model.authorDetails!.name ?? "",
                                dateReview:
                                    DateConverter.convertDate(model.createdAt!),
                                rate: model.authorDetails!.rating ?? 0,
                                comment: model.content ?? "");
                          })
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
