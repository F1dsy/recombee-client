import 'recombee_request.dart';

class AddCartAddition extends RecombeeRequest {
  AddCartAddition({
    required this.userId,
    required this.itemId,
    this.timestamp,
    this.cascadeCreate,
    this.amount,
    this.price,
    this.recommId,
    super.timeout = 3000,
  }) : super(method: 'POST');

  String userId;
  String itemId;
  final String? timestamp;
  final bool? cascadeCreate;
  final double? amount;
  final double? price;
  final String? recommId;

  @override
  Map<String, dynamic> requestBody() => {
        'userId': userId,
        'itemId': itemId,
        if (timestamp != null) 'timestamp': timestamp,
        if (cascadeCreate != null) 'cascadeCreate': cascadeCreate.toString(),
        if (amount != null) 'amount': amount.toString(),
        if (price != null) 'price': price.toString(),
        if (recommId != null) 'recommId': recommId,
      };

  @override
  Uri get uri => Uri(path: '/cartadditions/');
}
