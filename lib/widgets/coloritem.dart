import 'package:flutter/material.dart';

class Coloritem extends StatelessWidget {
  final bool istapped;
  final int backgroundColor;

  const Coloritem({
    super.key,
    this.backgroundColor = 0xff607D8B,
    required this.istapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: (istapped == false)
          ? CircleAvatar(backgroundColor: Color(backgroundColor))
          : CircleAvatar(
              backgroundColor: Colors.white,
              radius: 22,
              child: CircleAvatar(backgroundColor: Color(backgroundColor)),
            ),
    );
  }
}
