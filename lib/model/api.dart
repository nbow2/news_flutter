// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:news_flutter/model/SourceResponse.dart';
// import 'package:news_flutter/model/api_constents.dart';
//
// /* API KEY
// https://newsapi.org/v2/top-headlines/sources?apiKey=762012fc28ed4900838feaf9e6045bb0
//  */
// class ApiManager{
//
//  static Future<SourceResponse?> getSources()async{
//     Uri url = Uri.https(APIConstants.baseUrl,APIConstants.sourceAPI,
//         {
//           'apiKey': '762012fc28ed4900838feaf9e6045bb0'
//         });
//     var response = await http.get(url);
//     try{
//       SourceResponse.fromJson(jsonDecode(response.body));
//     }catch(e){
//       throw e;
//     }
//  }
//
// }
//
// ////TODO: example for http response
// // Future<http.Response> fetchAlbum() {
// //   return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
// // }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_flutter/model/SourceResponse.dart';
import 'package:news_flutter/model/api_constents.dart';

class ApiManager {
  static Future<SourceResponse?> getSources() async {
    try {
      Uri url = Uri.https(APIConstants.baseUrl, APIConstants.sourceAPI, {
        'apiKey': '762012fc28ed4900838feaf9e6045bb0',
      });

      var response = await http.get(url);

      if (response.statusCode == 200) {
        // Decode the JSON response
        return SourceResponse.fromJson(jsonDecode(response.body));
      } else {
        // Handle errors or unsuccessful responses
        return SourceResponse(
          status: 'error',
          message: 'Failed to load data',
          sources: [],
        );
      }
    } catch (e) {
      // Handle any exceptions or errors
      return SourceResponse(
        status: 'error',
        message: e.toString(),
        sources: [],
      );
    }
  }
}
