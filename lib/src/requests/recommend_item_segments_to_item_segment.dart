import 'package:recombee_client/src/bindings/Logic.dart';

import 'recombee_request.dart';

class RecommendItemSegmentsToItemSegment extends RecombeeRequest {
  RecommendItemSegmentsToItemSegment({
    required this.contextSegmentId,
    required this.targetUserId,
    required this.count,
    this.scenario,
    this.cascadeCreate = true,
    this.filter,
    this.booster,
    this.logic,
    super.timeout = 3000,
  }) : super(method: 'GET');

  final String contextSegmentId;
  final String targetUserId;
  final int count;
  final String? scenario;
  final bool? cascadeCreate;
  final String? filter;
  final String? booster;
  final Logic? logic;

  @override
  Uri get uri => Uri(
        path: '/recomms/item-segments/item-segments/',
        queryParameters: {
          'contextSegmentId': contextSegmentId,
          'targetUserId': targetUserId,
          'count': count.toString(),
          if (scenario != null) 'scenario': scenario,
          if (cascadeCreate != null) 'cascadeCreate': cascadeCreate.toString(),
          if (filter != null) 'filter': filter,
          if (booster != null) 'booster': booster,
          if (logic != null) 'logic': logic.toString(),
        },
      );

  @override
  Map<String, dynamic> requestBody() => {};
}
