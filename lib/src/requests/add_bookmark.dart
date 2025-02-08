import 'package:recombee_client/recombee_client.dart';

class AddBookmark extends RecombeeRequest<RecombeeResponse> {
  final String userId;
  final String itemId;
  final String? timestamp;
  final bool? cascadeCreate;
  final String? recommId;

  AddBookmark({
    required this.userId,
    required this.itemId,
    this.timestamp,
    this.cascadeCreate,
    this.recommId,
    super.timeout = 3000,
  }) : super(method: 'POST');

  @override
  Uri get uri => Uri(path: '/bookmarks/');

  @override
  Map<String, dynamic> requestBody() => {
        'userId': userId,
        'itemId': itemId,
        if (timestamp != null) 'timestamp': timestamp,
        if (cascadeCreate != null) 'cascadeCreate': cascadeCreate.toString(),
        if (recommId != null) 'recommId': recommId,
      };
}
