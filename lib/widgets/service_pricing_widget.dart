import 'package:flutter/material.dart';
import '../screens/form_screen.dart';

class ServiceWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const ServiceWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      color: Colors.grey[100],
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  'https://bensalcie.payherokenya.com/portal/images/$image',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                  Text(description),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SreenWidget()));
                    },
                    icon: const Icon(Icons.account_circle_sharp),
                    label: const Text('BOOK NOW'),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.orange[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
