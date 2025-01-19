import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:recombee_client/src/exceptions/recombee_response_exception.dart';

import 'requests/recombee_request.dart';

class RecombeeClient {
  final String _databaseId;
  final String _publicToken;
  final String _baseUri;
  final bool _useHttps;

  final Map<String, String> _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  RecombeeClient({
    required String databaseId,
    required String publicToken,
    String baseUri = 'client-rapi.recombee.com',
    bool useHttps = true,
  })  : _databaseId = databaseId,
        _publicToken = publicToken,
        _baseUri = baseUri,
        _useHttps = useHttps;

  Future<String> send(RecombeeRequest request) async {
    try {
      final signedUrl = signUrl(request.uri);
      final url = signedUrl.replace(
        scheme: _useHttps ? 'https' : 'http',
        host: _baseUri,
      );

      late Future<http.Response> callRequest;

      switch (request.method) {
        case 'POST':
          callRequest = http.post(
            url,
            headers: _headers,
            body: jsonEncode(request.requestBody()),
          );
          break;
        default:
          callRequest = http.get(
            url,
            headers: _headers,
          );
      }

      final response = await callRequest;

      if (response.statusCode == 200) {
        return response.body;
      } else {
        final responseBody = jsonDecode(response.body);

        throw RecombeResponseException(
          message: responseBody['message'],
          code: response.statusCode,
          stackTrace: StackTrace.current,
        );
      }
    } on SocketException catch (error, stackTrace) {
      throw RecombeResponseException(
        message: error.osError?.message ?? error.message,
        code: error.osError?.errorCode ?? 0,
        stackTrace: stackTrace,
      );
    }
  }

  Uri signUrl(Uri path) {
    var url = path.replace(path: '/$_databaseId${path.path}');

    url = url.replace(queryParameters: {
      ...url.queryParameters,
      'frontend_timestamp':
          (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString(),
    });

    final keys = utf8.encode(_publicToken);
    final urlBytes = utf8.encode(url.toString());

    final hmacSha1 = Hmac(sha1, keys);
    final digest = hmacSha1.convert(urlBytes);

    url = url.replace(queryParameters: {
      ...url.queryParameters,
      'frontend_sign': digest.toString(),
    });

    return url;
  }
}
