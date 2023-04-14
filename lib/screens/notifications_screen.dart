import 'package:flutter/material.dart';
import '../widgets/notifications_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: NotificationsWidget());
  }
}
