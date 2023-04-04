import 'package:cj_app/screens/services_pricing_screen.dart';
import 'package:cj_app/screens/tour_services_screen.dart';
import 'package:flutter/material.dart';
import '../screens/portfolio_data_screen.dart';

import 'grid_item.dart';

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
              } else if (titles[index] == 'Services & Pricing') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const ServicesAndPricingScreen()),
                  ),
                );
              } else if (titles[index] == 'Portfolio') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const PortfolioData()),
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
