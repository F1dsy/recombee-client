import 'recombee_request.dart';

/**
 * Recommends a set of items that are somehow related to one given item, *X*. A typical scenario is when the user *A* is viewing *X*. Then you may display items to the user that he might also be interested in. Recommend items to item request gives you Top-N such items, optionally taking the target user *A* into account.
 * The returned items are sorted by relevance (the first item being the most relevant).
 * Besides the recommended items, also a unique `recommId` is returned in the response. It can be used to:
 * - Let Recombee know that this recommendation was successful (e.g., user clicked one of the recommended items). See [Reported metrics](https://docs.recombee.com/admin_ui.html#reported-metrics).
 * - Get subsequent recommended items when the user scrolls down (*infinite scroll*) or goes to the next page. See [Recommend Next Items](https://docs.recombee.com/api.html#recommend-next-items).
 * It is also possible to use POST HTTP method (for example in the case of a very long ReQL filter) - query parameters then become body parameters.
 */
class RecommendItemsToItem implements RecombeeRequest {
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
  });

  @override
  Map<String, dynamic> requestBody() {
    return {};
  }

  @override
  String get method => 'GET';

  @override
  String get path =>
      Uri(path: '/recomms/items/$itemId/items/', queryParameters: {
        'targetUserId': targetUserId,
        'count': count.toString(),
        if (scenario != null) 'scenario': scenario,
        if (cascadeCreate != null) 'cascadeCreate': cascadeCreate,
        if (returnProperties != null) 'returnProperties': returnProperties,
        if (includedProperties != null)
          'includedProperties': includedProperties,
        if (filter != null) 'filter': filter,
        if (booster != null) 'booster': booster,
      }).toString();

  @override
  int get timeout => 100;

  @override
  set method(String _method) {
    // TODO: implement method
  }

  @override
  set path(String _path) {
    // TODO: implement path
  }

  @override
  set timeout(int _timeout) {
    // TODO: implement timeout
  }
}
