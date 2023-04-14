import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/notification_data.dart';
import 'package:http/http.dart' as http;

class NotificationProvider with ChangeNotifier {
  NotificationsDta _notifications = NotificationsDta();

  NotificationsDta get notifications => _notifications;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<NotificationsDta> getNotificationsData() async {
    _isLoading = true;
    final response = await http.get(Uri.parse(
        'https://bensalcie.payherokenya.com/portal/api/notifications.php'));
    try {
      if (response.statusCode == 200) {
        _notifications = NotificationsDta.fromJson(jsonDecode(response.body));
        _isLoading = false;
        notifyListeners();

        print('Msee${_notifications.notifications!.length}');
      }
    } catch (error) {}

    return _notifications;
  }
}






// Future<PortfolioData> getPortfolioData() async {
//     try {
//       _isLoading = true;
//       final response = await http.get(Uri.parse(
//           'https://bensalcie.payherokenya.com/portal/api/portfolio.php'));
//       if (response.statusCode == 200) {
//         _portData = PortfolioData.fromJson(jsonDecode(response.body));
//         _isLoading = false;
//         notifyListeners();
//         print('Noma${_portData.services?.first.image}');
//       }
//     } catch (error) {}
//     return _portData;
//   }