import 'package:flutter/material.dart';

class CarouselScreen extends StatefulWidget {
  final String title;
  final String imageUrl;
  const CarouselScreen(
      {super.key, required this.imageUrl, required this.title});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, pagePosition) {
        return Container(
          height: 80,
          margin: const EdgeInsets.all(10),
          child: Image.network(
              'https://bensalcie.payherokenya.com/portal/images/${widget.imageUrl}'[
                  pagePosition]),
        );
      },
      pageSnapping: true,
      itemCount: widget.imageUrl.length,
    );
  }
}
