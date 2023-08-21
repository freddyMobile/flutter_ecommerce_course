import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class SingleProductImage extends StatelessWidget {
  final String imageUrl;
  const SingleProductImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InstaImageViewer(
      child: Container(
        width: size.width,
        height: size.height * 0.45,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
