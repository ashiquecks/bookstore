import 'dart:convert';
import 'dart:io';
import 'package:bookstore/MODAL/bookDetailsModal.dart';
import 'package:bookstore/RESPONS/networkRespose.dart';
import 'package:http/http.dart' as http;

Future<NetworkResponse<BookDetailsModal>> getBookDetailsApi(
    {required String detailsUrl}) async {
  try {
    var request = http.Request('GET', Uri.parse(detailsUrl));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = jsonDecode(await response.stream.bytesToString());

      BookDetailsModal bookDetails = BookDetailsModal.fromJson(await body);

      return NetworkResponse(true, bookDetails,
          responseCode: response.statusCode);
    } else {
      return NetworkResponse(false, null,
          message:
              'Invalid response recived from server! please try again in a minutes or two',
          responseCode: response.statusCode);
    }
  } on SocketException {
    return NetworkResponse(
      false,
      null,
      message:
          "Unable to reach the internet! Please try again in  a minutes or two",
    );
  } on FormatException {
    return NetworkResponse(
      false,
      null,
      message:
          "Invalid response receved form the server! Please try again in a minutes or two",
    );
  } catch (e) {
    return NetworkResponse(false, null,
        message: 'somthing went wrong please try again in a minute or two');
  }
  throw Exception('Unexpected error occured!');
}
