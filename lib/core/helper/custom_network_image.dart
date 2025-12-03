import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetowrkImage extends StatelessWidget {
  const CustomNetowrkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.fit,
  });

  final String? imageUrl;
  final double? width;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
      );
    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        width: width,
        fit: fit,
        placeholder: (context, url) => Skeletonizer(
          enableSwitchAnimation: true,
          switchAnimationConfig: const SwitchAnimationConfig(
            duration: Duration(milliseconds: 500),
            switchInCurve: Curves.bounceIn,
            switchOutCurve: Curves.bounceOut,
            reverseDuration: Duration(milliseconds: 500),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              color: Colors.grey.shade200,
              width: width,
              height: width,
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Center(
          child: Icon(Icons.error),
        ),
      );
    }
  }
}
