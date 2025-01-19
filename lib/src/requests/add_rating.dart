import 'package:recombee_client/src/requests/recombee_request.dart';

class AddRating extends RecombeeRequest {
  final String userId;
  final String itemId;
  final double rating;
  final String? timestamp;
  final bool? cascadeCreate;
  final String? recommId;

  AddRating(
    this.userId,
    this.itemId,
    this.rating, {
    this.timestamp,
    this.cascadeCreate = true,
    this.recommId,
    super.timeout = 3000,
  }) : super(method: 'POST');

  @override
  Map<String, dynamic> requestBody() => {
        'userId': userId,
        'itemId': itemId,
        'rating': rating,
        if (timestamp != null) 'timestamp': timestamp.toString(),
        if (cascadeCreate != null) 'cascadeCreate': cascadeCreate,
        if (recommId != null) 'recommId': recommId,
      };

  @override
  Uri get uri => Uri(path: '/ratings/');
}
