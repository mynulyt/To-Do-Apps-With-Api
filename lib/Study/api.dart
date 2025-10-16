// import 'dart:convert';
// import 'package:http/http.dart';
// import 'package:logger/logger.dart';

// // ApiCaller class — GET & POST request handle korbe
// class ApiCaller {
//   static final Logger _logger = Logger();
//   // ekta logger instance create kora holo

//   static Future<ApiResponse> getRequest({required String url}) async {
//     try {
//       Uri uri = Uri.parse(url);
//       // string url ke Uri object e convert kora holo

//       _logRequest(url);
//       // request log print korbe

//       Response response = await get(uri);
//       // http GET call kora holo

//       _logResponse(url, response);
//       // response log print korbe

//       final int statusCode = response.statusCode;
//       // response status code ber kora holo

//       if (statusCode == 200) {
//         // jodi success hoy (200)
//         final decodedData = jsonDecode(response.body);
//         // json body decode kora holo

//         return ApiResponse(
//           isSuccess: true,
//           responseCode: statusCode,
//           responseData: decodedData,
//         );
//         // ApiResponse object return kora holo success = true diye
//       } else {
//         // jodi success na hoy
//         final decodedData = jsonDecode(response.body);
//         // error response o decode kora holo

//         return ApiResponse(
//           isSuccess: false,
//           responseCode: statusCode,
//           responseData: decodedData,
//           errorMessage: decodedData['data'],
//         );
//         // ApiResponse return holo success = false diye
//       }
//     } on Exception catch (e) {
//       // exception hole catch korbe
//       return ApiResponse(
//         isSuccess: false,
//         responseCode: -1,
//         responseData: null,
//         errorMessage: e.toString(),
//       );
//       // exception message return korbe
//     }
//   }

//   static Future<ApiResponse> postRequest({
//     required String url,
//     Map<String, dynamic>? body,
//   }) async {
//     try {
//       Uri uri = Uri.parse(url);
//       // url ke Uri object e convert kora holo

//       _logRequest(url, body: body);
//       // post request log print korbe

//       Response response = await post(
//         uri,
//         headers: {'content-type': 'application/json'},
//         body: jsonEncode(body),
//       );
//       // http POST request pathano holo JSON body shoho

//       _logResponse(url, response);
//       // response log print korbe

//       final int statusCode = response.statusCode;
//       // status code ber kora holo

//       if (statusCode == 200 || statusCode == 201) {
//         // success hole (200 OK or 201 Created)
//         final decodedData = jsonDecode(response.body);
//         // response body decode kora holo

//         return ApiResponse(
//           isSuccess: true,
//           responseCode: statusCode,
//           responseData: decodedData,
//         );
//         // success ApiResponse return holo
//       } else {
//         // jodi fail hoy
//         final decodedData = jsonDecode(response.body);
//         // fail response decode kora holo

//         return ApiResponse(
//           isSuccess: false,
//           responseCode: statusCode,
//           responseData: decodedData,
//           errorMessage: decodedData['data'],
//         );
//         // fail ApiResponse return holo
//       }
//     } on Exception catch (e) {
//       // exception hole catch korbe
//       return ApiResponse(
//         isSuccess: false,
//         responseCode: -1,
//         responseData: null,
//         errorMessage: e.toString(),
//       );
//       // exception message return kora holo
//     }
//   }

//   static void _logRequest(String url, {Map<String, dynamic>? body}) {
//     _logger.i(
//       'URL => $url\n'
//       'Request Body: $body',
//     );
//     // request log show korbe console e
//   }

//   static void _logResponse(String url, Response response) {
//     _logger.i(
//       'URL => $url\n'
//       'Status Code: ${response.statusCode}\n'
//       'Body: ${response.body}',
//     );
//     // response log show korbe console e
//   }
// }

// // ApiResponse class — response er data rakhar jonno
// class ApiResponse {
//   final bool isSuccess;
//   // request success hoise kina
//   final int responseCode;
//   // http status code or -1 jodi error
//   final dynamic responseData;
//   // decoded JSON response
//   final String? errorMessage;
//   // error thakle message

//   ApiResponse({
//     required this.isSuccess,
//     required this.responseCode,
//     required this.responseData,
//     this.errorMessage = 'Something went wrong',
//   });
//   // constructor diye value set kora hoyeche
// }
