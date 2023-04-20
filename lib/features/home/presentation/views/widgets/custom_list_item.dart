import 'package:bookly_app/core/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final double borderRadius;
  final String ? imageUrl;
  const CustomListItem(
      {Key? key, this.borderRadius = 20, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child:  CachedNetworkImage(
          imageUrl: imageUrl.toString(),
          errorWidget: (context, url, error) => const Center(
            child:  Icon(Icons.error_outline),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
