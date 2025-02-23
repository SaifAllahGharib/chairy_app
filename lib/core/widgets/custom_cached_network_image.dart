import 'package:cached_network_image/cached_network_image.dart';
import 'package:chairy_app/core/services/constants.dart';
import 'package:chairy_app/core/widgets/loading.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String image;

  const CustomCachedNetworkImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "$BASEURL$image",
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) {
        return Loading();
      },
    );
  }
}
