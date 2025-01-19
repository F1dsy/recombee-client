import 'package:recombee_client/src/bindings/Logic.dart';

import 'recombee_request.dart';

class SearchItemsSegements extends RecombeeRequest {
  SearchItemsSegements({
    required this.searchQuery,
    required this.userId,
    required this.count,
    this.scenario,
    this.cascadeCreate,
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

  final String? filter;
  final String? booster;
  final Logic? logic;

  @override
  Uri get uri => Uri(
        path: '/search/users/$userId/item-segments/',
        queryParameters: {
          'searchQuery': searchQuery,
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
