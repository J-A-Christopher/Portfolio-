import 'package:cj_app/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'profile_screen.dart';
import '../widgets/grid_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CrouselHandler(),
          const ProfileScreen(),
          const GridScreen(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Connect With Me'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: const Color(0xff007FFF),
                  child: IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.twitter),
                    color: Colors.black,
                  ),
                ),
              ),
              Link(
                target: LinkTarget.self,
                uri: Uri.parse('https://flutter.dev'),
                builder: (context, followLink) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      onPressed: followLink,
                      icon: const FaIcon(FontAwesomeIcons.linkedin),
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.redAccent,
                child: Link(
                  target: LinkTarget.self,
                  uri: Uri.parse('https://flutter.dev'),
                  builder: (context, followLink) => IconButton(
                    onPressed: followLink,
                    icon: const FaIcon(FontAwesomeIcons.instagram),
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
