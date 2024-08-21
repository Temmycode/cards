import 'package:cards/widgets/image_loader.dart';
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final String url;

  const AvatarImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: ImageLoader(
        imageUrl: url,
        height: 40,
        width: 40,
      ),
    );
  }
}
