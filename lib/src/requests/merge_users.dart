import 'package:recombee_client/src/requests/recombee_request.dart';

class MergeUsers extends RecombeeRequest {
  MergeUsers({
    required this.targetUserId,
    required this.sourceUserId,
    this.cascadeCreate,
    super.timeout = 3000,
  }) : super(method: 'PUT');

  final String targetUserId;
  final String sourceUserId;
  final bool? cascadeCreate;

  @override
  Map<String, dynamic> requestBody() => {};

  @override
  Uri get uri =>
      Uri(path: '/users/$targetUserId/merge/$sourceUserId', queryParameters: {
        if (cascadeCreate != null) 'cascadeCreate': cascadeCreate,
      });
}
