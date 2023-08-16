import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserReviewWidget extends StatelessWidget {
  final String imgProfile;
  final String name;
  final String dateReview;
  final double rate;
  final String comment;

  const UserReviewWidget({
    required this.imgProfile,
    required this.name,
    required this.dateReview,
    required this.rate,
    required this.comment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 1),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: Colors.white,
        child: Column(
          children: [
            Row(children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    image: imgProfile.isEmpty
                        ? const DecorationImage(
                            image: AssetImage("images/imgProfile.png"),
                            fit: BoxFit.cover)
                        : DecorationImage(
                            image: NetworkImage(imgProfile), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(32)),
              ),
              const SizedBox(width: 8),
              Text(name.isEmpty ? "User Name" : name,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ]),
            const SizedBox(height: 4),
            Row(
              children: [
                RatingBarIndicator(
                  rating: rate / 2,
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Colors.deepOrange),
                  itemCount: 5,
                  itemSize: 20.0,
                  unratedColor: Colors.deepOrange.withAlpha(90),
                  direction: Axis.horizontal,
                ),
                const SizedBox(width: 8),
                Text(dateReview,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 6),
            Text(comment,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, color: Colors.black)),
          ],
        ));
  }
}
