import 'recombee_request.dart';

class AddDetailView extends RecombeeRequest {
  final String userId;
  final String itemId;

  AddDetailView({
    required this.userId,
    required this.itemId,
    super.timeout = 3000,
  }) : super(method: 'POST');

  @override
  Map<String, dynamic> requestBody() {
    return {
      'userId': userId,
      'itemId': itemId,
    };
  }

  @override
  Uri get uri => Uri(path: '/detailviews/');
}
