import 'recombee_request.dart';

class RecommendNextItems extends RecombeeRequest {
  RecommendNextItems({
    required this.recommId,
    required this.count,
    super.timeout = 3000,
  }) : super(method: 'GET');

  final String recommId;
  final int count;

  @override
  Uri get uri => Uri(path: '/recomms/next/items/$recommId', queryParameters: {
        'count': count.toString(),
      });

  @override
  Map<String, dynamic> requestBody() => {};
}
