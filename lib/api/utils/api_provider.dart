import 'dart:io';
import 'package:flutter_mvc/api/errors/custom_exceptions.dart';
import 'package:flutter_mvc/api/utils/token_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  static final String _authority = "authority.com";
  static final String _basePath = "/base/path/";
  final String _baseUrl;
  TokenManager _tokenManager;

  ApiProvider()
      : _baseUrl = "https://$_authority$_basePath",
        _tokenManager = TokenManager.getInstance;

  Future<dynamic> post(
      String path, {
        dynamic requestBody,
        Map<String, String> headers,
        bool authorized = false,
      }) async {
    var responseJson;
    try {
      final response = await http.post(_baseUrl + path,
          body: requestBody,
          headers:
          authorized ? headers.addAuthorization(token: await _tokenManager.token) : headers);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> get(String path,
      {Map<String, String> headers, bool authorized = false, Map<String, String> params}) async {
    var responseJson;
    try {
      var uri = Uri.https(_authority, _basePath + path, params);

      final response = await http.get(uri,
          headers:
          authorized ? headers.addAuthorization(token: await _tokenManager.token) : headers);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> delete(String path,
      {Map<String, String> headers, bool authorized = false}) async {
    try {
      final url = Uri.https(_authority, _basePath + path);
      final response = await http.delete(url,
          headers:
          authorized ? headers.addAuthorization(token: await _tokenManager.token) : headers);
      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _response(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      dynamic responseJson;
      try {
        responseJson = json.decode(response.body.toString());
      } catch (e) {
        responseJson = Map<String, dynamic>();
      }
      print("Json response is: ");
      print(responseJson);
      return responseJson;
    }

    switch (response.statusCode) {
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

extension AddAuthorization on Map<String, String> {
  Map<String, String> addAuthorization({String token}) =>
      (this ?? Map<String, String>())..["Authorization"] = "Bearer $token";
}
