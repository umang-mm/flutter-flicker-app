import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final String imageUrl;
  final String imageTitle;

  const ImageDetail({
    super.key,
    required this.imageUrl,
    required this.imageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Detail Screen'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 1,
                child: Image.network(
                  imageUrl,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  imageTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
              )
            ],
          )),
    );
  }
}
