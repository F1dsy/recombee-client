import 'package:recombee_client/recombee_client.dart';

class AddDetailView extends RecombeeRequest<RecombeeResponse> {
  AddDetailView({
    required this.userId,
    required this.itemId,
    this.timestamp,
    this.duration,
    this.cascadeCreate,
    this.recommId,
    super.timeout = 3000,
  }) : super(method: 'POST');

  final String userId;
  final String itemId;
  final String? timestamp;
  final int? duration;
  final bool? cascadeCreate;
  final String? recommId;

  @override
  Map<String, dynamic> requestBody() => {
        'userId': userId,
        'itemId': itemId,
        if (timestamp != null) 'timestamp': timestamp,
        if (duration != null) 'duration': duration.toString(),
        if (cascadeCreate != null) 'cascadeCreate': cascadeCreate.toString(),
        if (recommId != null) 'recommId': recommId,
      };

  @override
  Uri get uri => Uri(path: '/detailviews/');
}
