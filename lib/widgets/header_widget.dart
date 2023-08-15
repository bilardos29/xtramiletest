import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String? name;

  const HeaderWidget({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello $name",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                  SizedBox(height: 2),
                  const Text("what do you want to watch?",
                      style:
                          const TextStyle(color: Colors.black, fontSize: 12)),
                ],
              ),
              const AccountImage()
            ],
          ),
          SizedBox(height: 12),
          TextField(
              decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: "Search",
          )),
        ],
      ),
    );
  }
}

class AccountImage extends StatelessWidget {
  const AccountImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(Icons.account_circle, size: 40),
    );
  }
}
