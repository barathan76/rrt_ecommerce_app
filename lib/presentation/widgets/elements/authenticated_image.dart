import 'package:api_repository/api_repository.dart' show backend, userToken;
import 'package:flutter/material.dart';

class AuthenticatedImage extends StatelessWidget {
  const AuthenticatedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: userToken,
      builder: (context, snapshot) {
        final token = snapshot.data;
        if (snapshot.hasError || token == null || token.isEmpty) {
          return _placeholder();
        }

        final parsedUrl = Uri.parse(imageUrl);
        final resolvedUrl =
            parsedUrl.hasScheme
                ? parsedUrl
                : Uri.parse(backend).resolve(imageUrl);

        return Image.network(
          resolvedUrl.toString(),
          headers: {'Authorization': token},
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) => _placeholder(),
        );
      },
    );
  }

  Widget _placeholder() => Container(
    width: width,
    height: height,
    color: Colors.grey[300],
    alignment: Alignment.center,
    child: const Icon(Icons.broken_image, color: Colors.grey, size: 40),
  );
}
