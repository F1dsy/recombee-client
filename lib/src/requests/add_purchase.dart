import 'package:recombee_client/recombee_client.dart';

class AddPurchase extends RecombeeRequest<RecombeeResponse> {
  AddPurchase({
    required this.userId,
    required this.itemId,
    this.timestamp,
    this.cascadeCreate,
    this.amount,
    this.price,
    this.profit,
    this.recommId,
    super.timeout = 3000,
  }) : super(method: 'POST');

  final String userId;
  final String itemId;
  final String? timestamp;
  final bool? cascadeCreate;
  final double? amount;
  final double? price;
  final double? profit;
  final String? recommId;

  @override
  Map<String, dynamic> requestBody() => {
        'userId': userId,
        'itemId': itemId,
        if (timestamp != null) 'timestamp': timestamp,
        if (cascadeCreate != null) 'cascadeCreate': cascadeCreate,
        if (amount != null) 'amount': amount,
        if (price != null) 'price': price,
        if (profit != null) 'profit': profit,
        if (recommId != null) 'recommId': recommId,
      };

  @override
  Uri get uri => Uri(path: '/purchases/');
}
