import 'package:recombee_client/recombee_client.dart';

class RecommendItemsToUser extends RecombeeRequest<RecommendationResponse> {
  RecommendItemsToUser({
    required this.userId,
    required this.count,
    this.scenario,
    this.cascadeCreate,
    this.returnProperties,
    this.includedProperties,
    this.filter,
    this.booster,
    this.logic,
    this.minRelevance,
    this.rotationRate,
    this.rotationTime,
    super.timeout = 3000,
  }) : super(method: 'GET');

  final String userId;
  final int count;
  final String? scenario;
  final bool? cascadeCreate;
  final bool? returnProperties;
  final List<String>? includedProperties;
  final String? filter;
  final String? booster;
  final Logic? logic;
  final String? minRelevance;
  final double? rotationRate;
  final double? rotationTime;

  @override
  Map<String, dynamic> requestBody() => {};

  @override
  Uri get uri => Uri(path: '/recomms/users/$userId/items/', queryParameters: {
        'count': count,
        if (scenario != null) 'scenario': scenario,
        if (cascadeCreate != null) 'cascadeCreate': cascadeCreate,
        if (returnProperties != null) 'returnProperties': returnProperties,
        if (includedProperties != null)
          'includedProperties': includedProperties,
        if (filter != null) 'filter': filter,
        if (booster != null) 'booster': booster,
        if (logic != null) 'logic': logic,
        if (minRelevance != null) 'minRelevance': minRelevance,
        if (rotationRate != null) 'rotationRate': rotationRate,
        if (rotationTime != null) 'rotationTime': rotationTime,
      });
}
