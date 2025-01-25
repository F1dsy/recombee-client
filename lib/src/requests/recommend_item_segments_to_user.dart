import 'package:recombee_client/recombee_client.dart';

class RecommendItemSegmentsToUser
    extends RecombeeRequest<RecommendationResponse> {
  RecommendItemSegmentsToUser({
    required this.userId,
    required this.count,
    this.scenario,
    this.cascadeCreate = true,
    this.filter,
    this.booster,
    this.logic,
    super.timeout = 3000,
  }) : super(method: 'GET');

  final String userId;
  final int count;
  final String? scenario;
  final bool? cascadeCreate;
  final String? filter;
  final String? booster;
  final Logic? logic;

  @override
  Uri get uri => Uri(
        path: '/recomms/users/$userId/item-segments/',
        queryParameters: {
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
