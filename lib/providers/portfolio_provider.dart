import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/portfolio_data_model.dart';
import 'package:http/http.dart' as http;

class PortfolioRetrievedData extends ChangeNotifier {
  PortfolioData _portData = PortfolioData();
  PortfolioData get portData => _portData;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<PortfolioData> getPortfolioData() async {
    try {
      _isLoading = true;
      final response = await http.get(Uri.parse(
          'https://bensalcie.payherokenya.com/portal/api/portfolio.php'));
      if (response.statusCode == 200) {
        _portData = PortfolioData.fromJson(jsonDecode(response.body));
        _isLoading = false;
        notifyListeners();
        // print('Noma${_portData.services?.first.image}');
      }
    } catch (error) {}
    return _portData;
  }
}
// https:bensalcie.payherokenya.com/portal/images/b9ec0eacc3f130952.png