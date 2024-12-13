import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

// Written by Goodness Ade

void main() async {
  const int count = 10;
  const String url = 'https://random-data-api.com/api/v2/users?size=$count';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> users = json.decode(response.body);

      for (var user in users) {
        if (kDebugMode) {
          print('${user['uid']} - ${user['first_name']} ${user['last_name']}');
        }
      }
    } else {
      if (kDebugMode) {
        print('Error while loading users: ${response.statusCode}');
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error occurred: $e');
    }
  }
}

// In the case the you run into an error 429, it's an error from the server because 
// I made too many requests in a short period of time while coding the assignment. 
//You can try running the code again after a few minutes.