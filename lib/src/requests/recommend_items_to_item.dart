import 'recombee_request.dart';

class RecommendItemsToItem extends RecombeeRequest {
  final String itemId;
  final String targetUserId;
  final int count;
  final String? scenario;
  final bool? cascadeCreate;
  final bool? returnProperties;
  final List? includedProperties;
  final String? filter;
  final String? booster;

  RecommendItemsToItem({
    required this.itemId,
    required this.targetUserId,
    required this.count,
    this.scenario,
    this.cascadeCreate,
    this.returnProperties,
    this.includedProperties,
    this.filter,
    this.booster,
    super.timeout = 3000,
  }) : super(method: 'GET');

  @override
  Map<String, dynamic> requestBody() => {};

  @override
  Uri get uri => Uri(path: '/recomms/items/$itemId/items/', queryParameters: {
        'targetUserId': targetUserId,
        'count': count.toString(),
        if (scenario != null) 'scenario': scenario,
        if (cascadeCreate != null) 'cascadeCreate': cascadeCreate,
        if (returnProperties != null) 'returnProperties': returnProperties,
        if (includedProperties != null)
          'includedProperties': includedProperties,
        if (filter != null) 'filter': filter,
        if (booster != null) 'booster': booster,
      });
}
