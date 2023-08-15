import 'package:flutter/material.dart';
import 'package:xtramilemobiletest/widgets/headline_widget.dart';
import 'package:xtramilemobiletest/widgets/user_review_widget.dart';

class DetailMoviePage extends StatefulWidget {
  const DetailMoviePage({Key? key}) : super(key: key);

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.8,
              child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "images/imgmovie1.png",
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
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "images/imgmovie1.png",
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.white),
                                child: const Icon(Icons.play_circle,
                                    size: 60, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Text("Title",
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                            "when an unknown printer took a galley of type and scrambled it to make a type specimen"
                            " book. It has survived not only five centuries, but also the leap into electronic typesetting,"
                            " remaining essentially unchanged.",
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black)),
                      ),
                      const SizedBox(height: 4),
                      const HeadlineWidget(
                          headline: "User Reviews", isSingleLine: true),
                      const SizedBox(height: 4),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (index, context) {
                            return const UserReviewWidget(
                                imgProfile: "",
                                name: "Bung Haji",
                                dateReview: "12 Agustus 2023",
                                rate: 4.5,
                                comment:
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                                    " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                                    "when an unknown printer took a galley of type and scrambled it to make a type specimen"
                                    " book. It has survived not only five centuries, but also the leap into electronic typesetting,"
                                    " remaining essentially unchanged.");
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
