import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('News Feed'),
          centerTitle: true,
        ),
        body: ImageFeed(),
      ),
    );
  }
}

class ImageFeed extends StatelessWidget {
  final List<String> dummyImageUrls = List.generate(
    10,
    (index) => "https://via.placeholder.com/150",
  );

  @override
  Widget build(BuildContext context) {
    // Get the device's orientation
    final orientation = MediaQuery.of(context).orientation;

    // Determine the cross-axis count based on orientation
    int crossAxisCount = (orientation == Orientation.portrait) ? 1 : 2;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: dummyImageUrls.length,
      itemBuilder: (context, index) {
        return ImageCard(imageUrl: dummyImageUrls[index]);
      },
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imageUrl;

  ImageCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
