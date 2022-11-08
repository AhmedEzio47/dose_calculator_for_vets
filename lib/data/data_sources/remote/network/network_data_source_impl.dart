import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/exceptions.dart';
import '../../../../core/locale/locale_constants.dart';
import '../../../../core/utils/logger.dart';
import 'network_data_source.dart';

class NetworkDataSourceImpl implements NetworkDataSource {
  NetworkDataSourceImpl();
  @override
  Future<Map<String, dynamic>> delete(String url,
      {Map<String, String>? headers, Map? body}) async {
    try {
      final response = await http.delete(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: _appendHeader(customHeaders: headers),
      );

      return _handleResponse(response);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Map<String, dynamic>> get(String url, {Map? headers}) async {
    try {
      final response = await http.get(Uri.parse(url));
      return _handleResponse(response);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Map<String, dynamic>> multipart(String url,
      {Map? headers, body, files}) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> post(String url,
      {Map<String, String>? headers, Map? body}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: _appendHeader(customHeaders: headers),
      );

      return _handleResponse(response);
    } catch (e) {
      Logger.debugLog('Unhandled exception : $e');
      throw ServerException(message: e is ServerException ? e.message : null);
    }
  }

  @override
  Future<Map<String, dynamic>> put(String url, {Map? headers, body, encoding}) {
    throw UnimplementedError();
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final int statusCode = response.statusCode;
    if (statusCode >= 400) {
      Map<String, dynamic> errorJson = jsonDecode(response.body);

      throw ServerException.fromJson(errorJson);
    } else {
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      // print('Network result:' + result.toString());
      return result;
    }
  }

  Map<String, String> _appendHeader({Map<String, String>? customHeaders}) {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept-Language': currentLanguage
    };

    if (customHeaders != null) headers.addAll(customHeaders);

    return headers;
  }
}
