import 'package:recombee_client/recombee_client.dart';

class RecommendItemsToItemSegment
    extends RecombeeRequest<RecommendationResponse> {
  RecommendItemsToItemSegment({
    required this.contextSegmentId,
    required this.targetUserId,
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
  }) : super(method: 'POST');

  final String contextSegmentId;
  final String targetUserId;
  final int count;
  final String? scenario;
  final bool? cascadeCreate;
  final bool? returnProperties;
  final List<String>? includedProperties;
  final String? filter;
  final String? booster;
  final Logic? logic;
  final double? minRelevance;
  final double? rotationRate;
  final double? rotationTime;

  @override
  Map<String, dynamic> requestBody() => {};

  @override
  Uri get uri => Uri(path: '/recomms/item-segments/items/', queryParameters: {
        'contextSegmentId': contextSegmentId,
        'targetUserId': targetUserId,
        'count': count.toString(),
        if (scenario != null) 'scenario': scenario,
        if (cascadeCreate != null) 'cascadeCreate': cascadeCreate.toString(),
        if (returnProperties != null)
          'returnProperties': returnProperties.toString(),
        if (includedProperties != null)
          'includedProperties': includedProperties?.join(','),
        if (filter != null) 'filter': filter,
        if (booster != null) 'booster': booster,
        if (logic != null) 'logic': logic.toString(),
        if (minRelevance != null) 'minRelevance': minRelevance.toString(),
        if (rotationRate != null) 'rotationRate': rotationRate.toString(),
        if (rotationTime != null) 'rotationTime': rotationTime.toString(),
      });
}
