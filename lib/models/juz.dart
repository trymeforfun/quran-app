import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

// class Juz {
//   final int? code;
//   final String? status;
//   final String? message;
//   final List? data;

//   const Juz({
//     this.code,
//     this.status,
//     this.message,
//     this.data,
//   });

//   factory Juz.fromJson(Map<String, dynamic> json) {
//     return Juz(
//       code: json['code'] as int,
//       status: json['status'] as String,
//       message: json['message'] as String,
//       data: json['data'] as List<dynamic>,
//     );
//   }
// }

Future<Map<String, dynamic>> fetchJuz(int juzNumber) async {
  final response =
      await http.get(Uri.parse('https://api.quran.sutanlab.id/juz/$juzNumber'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return (jsonDecode(response.body) as Map<String, dynamic>)['data'];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load juz');
  }
}
