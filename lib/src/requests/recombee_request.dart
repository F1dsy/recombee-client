abstract class RecombeeRequest {
  RecombeeRequest({
    required this.method,
    required this.timeout,
  });
  final String method;
  final int timeout;

  Uri get uri;

  Map<String, dynamic> requestBody();
}
