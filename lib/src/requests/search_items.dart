import 'package:recombee_client/recombee_client.dart';

class SearchItems extends RecombeeRequest<RecommendationResponse> {
  SearchItems({
    required this.searchQuery,
    required this.userId,
    required this.count,
    this.scenario,
    this.cascadeCreate,
    this.returnProperties,
    this.includedProperties,
    this.filter,
    this.booster,
    this.logic,
    super.timeout = 3000,
  }) : super(method: 'GET');

  final String searchQuery;
  final String userId;
  final int count;
  final String? scenario;
  final bool? cascadeCreate;
  final bool? returnProperties;
  final List<String>? includedProperties;
  final String? filter;
  final String? booster;
  final Logic? logic;

  @override
  Uri get uri => Uri(
        path: '/search/users/$userId/items/',
        queryParameters: {
          'searchQuery': searchQuery,
          'count': count.toString(),
          if (scenario != null) 'scenario': scenario,
          if (cascadeCreate != null) 'cascadeCreate': cascadeCreate.toString(),
          if (returnProperties != null) 'returnProperties': returnProperties.toString(),
          if (includedProperties != null) 'includedProperties': includedProperties?.join(','),
          if (filter != null) 'filter': filter,
          if (booster != null) 'booster': booster,
          if (logic != null) 'logic': logic.toString(),
        },
      );

  @override
  Map<String, dynamic> requestBody() => {};
}
