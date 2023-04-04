import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/services_pricing_model.dart';
import 'package:http/http.dart' as http;

class ServicesProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  ServAndPricing _servData = ServAndPricing();
  ServAndPricing get servData => _servData;

  Future<ServAndPricing> getServPricingData() async {
    try {
      _isLoading = true;
      final response = await http.get(Uri.parse(
          'https://bensalcie.payherokenya.com/portal/api/products_services.php'));
      if (response.statusCode == 200) {
        _servData = ServAndPricing.fromJson(jsonDecode(response.body));
        _isLoading = false;
        notifyListeners();

        print('DataMoto: ${_servData.services!.first.title}');
      } else {
        _isLoading = false;
        notifyListeners();
        throw Exception('Error Loading Data ..');
      }
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      print(error);
      rethrow;
    }
    return _servData;
  }
}
