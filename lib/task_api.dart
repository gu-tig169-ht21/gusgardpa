import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model.dart';

const apiKey = '8f02a3ba-6bc0-4215-acca-eca2854346f6';
const apiURL = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class TaskAPI {
  static Future<List<Task>> addItem(Task task) async {
    Map<String, dynamic> json = Task.toJson(task);
    var bodyString = jsonEncode(json);
    var respone = await http.post(
      Uri.parse('$apiURL/todos?key=$apiKey'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = respone.body;
    var list = jsonDecode(bodyString);
    return list.map<Task>((data) {
      return Task.fromJson(data);
    }).toList();
  }

  static Future removeItem(String taskID) async {
    var respone =
        await http.delete(Uri.parse('$apiURL/todos/$taskID?key=$apiKey'));
    var bodyString = respone.body;
    var list = jsonDecode(bodyString);

    return list.map<Task>((data) {
      return Task.fromJson(data);
    }).toList();
  }

  static Future updateItem(String taskID, Task task) async {
    Map<String, dynamic> json = Task.toJson(task);
    var bodyString = jsonEncode(json);
    var response = await http.put(
      Uri.parse('$apiURL/todos/$taskID?key=$apiKey'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<Task>((data) {
      return Task.fromJson(data);
    }).toList();
  }

  static Future<List<Task>> itemList() async {
    http.Response response =
        await http.get(Uri.parse('$apiURL/todos?key=$apiKey'));
    var jSonResp = response.body;
    var json = jsonDecode(jSonResp);
    return json.map<Task>((data) {
      return Task.fromJson(data);
    }).toList();
  }
}
