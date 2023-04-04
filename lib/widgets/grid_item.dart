import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String name;
  final String picture;

  final Function() onPress;
  const GridItem({
    super.key,
    required this.name,
    required this.picture,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      child: GestureDetector(
        onTap: onPress,
        child: Card(
          shadowColor: Colors.grey[400],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/$picture',
                height: 80,
              ),
              Text(name),
            ],
          ),
        ),
      ),
    );
  }
}
