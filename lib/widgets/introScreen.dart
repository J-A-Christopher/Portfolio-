import 'package:cj_app/widgets/carousel.dart';
import 'package:flutter/material.dart';
import '../profile_screen.dart';
import '../widgets/grid_data.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [CrouselHandler(), ProfileScreen(), GridScreen()],
      ),
    );
  }
}
