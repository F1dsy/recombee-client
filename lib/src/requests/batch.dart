import 'package:recombee_client/recombee_client.dart';

class Batch extends RecombeeRequest<RecombeeResponse> {
  Batch({
    required this.requests,
    this.distinctRecomms,
    super.timeout = 3000,
  }) : super(method: 'POST');

  final List<RecombeeRequest> requests;
  final bool? distinctRecomms;

  @override
  Uri get uri => Uri(
        path: '/batch/',
      );

  @override
  Map<String, dynamic> requestBody() => {
        'requests': requests.map((e) => e).toList(),
        if (distinctRecomms != null) 'distinctRecomms': distinctRecomms,
      };
}
