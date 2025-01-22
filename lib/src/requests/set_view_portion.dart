import 'package:recombee_client/src/requests/recombee_request.dart';

class SetViewPortion extends RecombeeRequest {
  final String userId;
  final String itemId;
  final double portion;
  final String? sessionId;
  final String? timestamp;
  final bool? cascadeCreate;
  final String? recommId;
  final Map<String, dynamic>? additionalData;

  SetViewPortion({
    required this.userId,
    required this.itemId,
    required this.portion,
    this.sessionId,
    this.timestamp,
    this.cascadeCreate,
    this.recommId,
    this.additionalData,
    super.timeout = 3000,
  }) : super(method: 'POST');

  @override
  Map<String, dynamic> requestBody() => {
        'userId': userId,
        'itemId': itemId,
        'portion': portion.toString(),
        if (sessionId != null) 'sessionId': sessionId,
        if (timestamp != null) 'timestamp': timestamp,
        if (cascadeCreate != null) 'cascadeCreate': cascadeCreate.toString(),
        if (recommId != null) 'recommId': recommId,
        if (additionalData != null) 'additionalData': additionalData,
      };

  @override
  Uri get uri => Uri(path: '/viewportions/');
}
