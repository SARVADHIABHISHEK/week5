import 'dart:convert';
import 'dart:io';

import '../models/api_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {

  Future<List<ApiModel>> gridData() async {
    final List<ApiModel> apiModel = <ApiModel>[];
    final request = await http.get(Uri.parse('https://fabcurate.easternts.in/top.json'));
    try {
      if (request.statusCode == 200) {
        final jsonData = jsonDecode(request.body);
        if (jsonData['main_sticky_menu'] != null) {
          print(jsonData['main_sticky_menu']);
          jsonData['main_sticky_menu'].forEach((v) {
            apiModel.add(ApiModel.fromJson(v));
          });
        } else {
          throw Exception('somet');
        }
      } else {
        throw Exception('somet');
      }
    } on SocketException catch (_) {
      print('internet not working');

    } catch (_) {
      print('something went wrong');
      throw Exception('somet');
    }
    return apiModel;
  }
}
