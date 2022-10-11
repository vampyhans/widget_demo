import 'dart:convert';

import 'package:widget_demo/user.dart';
import 'package:http/http.dart' as http;

class RestAPIService {
  String apiurl = 'https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8';

  //Future method to get users from api
  Future<List<User>?> getUsers() async{
    final response = await http.get(Uri.parse(apiurl));

    if(response.statusCode == 200){
      getUsersList(response.body);

      print(response.body);
    }
    else{
      throw Exception('unable to get data');
    }
  }

  //// Convert Response body = User object List
  List<User>getUsersList(String responseBody)
  {
    final parseBody = json.decode(responseBody).cast<Map<String ,dynamic>>();
    return parseBody.map<User>((json) => User.fromJson(json)).toList();
  }
}
