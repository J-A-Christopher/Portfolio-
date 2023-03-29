import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/profile_model.dart';

class ProfileWidget extends StatefulWidget {
  final List<Data> usData;
  const ProfileWidget({super.key, required this.usData});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Hi Welcome',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Bidi.stripHtmlIfNeeded(widget.usData.first.description),
                        style: TextStyle(color: Colors.grey[55]),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Image.network(
                  'https://bensalcie.payherokenya.com/portal/images/${widget.usData.first.headerImage}',
                  height: 104,
                  fit: BoxFit.cover,
                )),
          ],
        ),
      ),
    );
    // const GridScreen()
  }
}
