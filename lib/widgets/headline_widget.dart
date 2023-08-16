import 'package:flutter/material.dart';

class HeadlineWidget extends StatelessWidget {
  final String headline;
  final bool isSingleLine;

  const HeadlineWidget(
      {required this.headline, this.isSingleLine = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            headline,
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          !isSingleLine
              ? const Text("See all >",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400))
              : const SizedBox(),
        ],
      ),
    );
  }
}
