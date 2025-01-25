import 'package:recombee_client/recombee_client.dart';

void main() async {
  final client = RecombeeClient(
    databaseId: 'bookido-dev',
    publicToken:
        '9v9UCjONSMeMXfAhP5B7hBKoF78Bj6plNiUJ6bq6GRuXpmYRFTlxbdgK4oMpybnB',
    useHttps: true,
  );

  try {
    final request = RecommendItemsToUser(
      userId: '1',
      count: 1,
      rotationRate: 0.2,
      cascadeCreate: true,
      returnProperties: true,
    );
    final reponse = await client.send(request);
    print(reponse);
  } on RecombeResponseException catch (e) {
    print(e.toString());
  }
}
