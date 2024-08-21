import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoader extends CachedNetworkImage {
  ImageLoader({
    super.key,
    required super.imageUrl,
    super.height,
    super.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
      ),
      height: height,
      width: width,
      fit: BoxFit.contain,
    );
  }
}
