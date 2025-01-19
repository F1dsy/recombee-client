import 'recombee_request.dart';

class AddCartAddition extends RecombeeRequest {
  dynamic userId;
  dynamic itemId;
  Map<String, dynamic> options;

  AddCartAddition({
    required this.userId,
    required this.itemId,
    this.options = const {},
    super.timeout = 3000,
  }) : super(method: 'POST');

  @override
  Map<String, dynamic> requestBody() {
    return {
      'userId': userId,
      'itemId': itemId,
      ...options,
    };
  }

  @override
  Uri get uri => Uri(path: '/cartadditions/');
}
