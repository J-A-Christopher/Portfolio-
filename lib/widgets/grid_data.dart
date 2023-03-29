import 'package:cj_app/widgets/servicesAndPricing_screen.dart';
import 'package:flutter/material.dart';

import '../models/grid_item.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      'Services & Pricing',
      'My Shop',
      'Portfolio',
      'Tour',
      'Resume',
      'Contact'
    ];
    final images = [
      'Services&Pricing.png',
      'My Shop.png',
      'Portfolio.png',
      'earth.png',
      'Resume.png',
      'Contact.png'
    ];
    return Flexible(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 380,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2),
        itemBuilder: ((context, index) {
          return GridItem(
            picture: images[index],
            name: titles[index],
            onPress: () {
              if (titles[index] == 'Tour') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const TourServices()),
                  ),
                );
              }
            },
          );
        }),
        itemCount: titles.length,
      ),
    );
  }
}
