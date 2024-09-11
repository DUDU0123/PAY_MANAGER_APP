import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:payee_info/core/api/api_url.dart';
import 'package:payee_info/model/models/user_model/user_model.dart';

class UserData {
  Future<UserModel?> getUserFromApi() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      log(response.body);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        // Check what `decodedData` actually contains
        List<dynamic> results = decodedData['results'];

        if (results.isNotEmpty) {
          // Assuming results is a list of user maps
          UserModel user = UserModel.fromJson(map: results[0]);
          log(user.toString());
          return user;
        } else {
          log('No users found in results.');
          return null;
        }
      } else {
        log('Failed to load data');
        return null;
      }
    } catch (e) {
      log("Error: $e");
      return null;
    }
  }
}
