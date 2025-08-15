import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 40,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

      decoration: BoxDecoration(
        color: Colors.grey,

        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search, size: 25),
      ),
    );
  }
}
