


import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String imageUrl;
  const ImageLoader({Key? key, required this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      borderRadius: BorderRadius.circular(30.0),
      child: Image.network(
        imageUrl,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child; // Image is fully loaded
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(child: Icon(Icons.error)); // Display error icon if image fails to load
        },
      ),
    );
  }
}