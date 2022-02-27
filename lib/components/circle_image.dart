import 'package:flutter/material.dart';


class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  final Image avatar;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Teacher avatar",
      child: CircleAvatar(
        radius: 40,
        backgroundImage: avatar.image,
      ),
    );
  }
}