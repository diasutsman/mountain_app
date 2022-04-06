import 'package:flutter/material.dart';
import 'package:mountain_app/model/mountain.dart';

class LikeButton extends StatefulWidget {
  final Mountain mountain;
  const LikeButton({Key? key, required this.mountain}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(4),
      tooltip: "Favorite",
      iconSize: 20,
      icon: Icon(
        widget.mountain.isLike ? Icons.favorite : Icons.favorite_outline,
      ),
      onPressed: () {
        setState(() {
          widget.mountain.isLike = !widget.mountain.isLike;
        });
      },
    );
  }
}
