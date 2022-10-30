import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? url;

  const Avatar({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return const Text("ERROR: URL is null");
    }
    return Hero(
      tag: 'Avatar Image',
      child: CircleAvatar(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.blue,
        radius: 55.0,
        child: ClipOval(
          child: CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 1000),
            fadeInCurve: Curves.bounceInOut,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: url!,
            fit: BoxFit.cover,
            height: 100.0,
          ),
        ),
      ),
    );
  }
}
