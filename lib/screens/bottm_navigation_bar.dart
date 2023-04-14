import 'package:flutter/material.dart';
import '../screens/introScreen.dart';
import '../screens/news_screen.dart';
import '../screens/notifications_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  final pages = [
    const IntroductionScreen(),
    const NewsScreen(),
    const NotificationsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        height: 60,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2))
            ],
            color: Colors.white60,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.person_rounded,
                  color: pageIndex == 0 ? Colors.amber : Colors.grey.shade700,
                  size: 35,
                )),
            IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.newspaper,
                  color: pageIndex == 1 ? Colors.amber : Colors.grey,
                  size: 35,
                )),
            IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: Icon(
                  Icons.notifications_active,
                  color: pageIndex == 2 ? Colors.amber : Colors.grey,
                  size: 35,
                ))
          ],
        ),
      ),
      body: pages[pageIndex],
    );
  }
}
