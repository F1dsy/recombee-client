import 'package:recombee_client/recombee_client.dart';

void main() async {
  final client = RecombeeClient(
    databaseId: 'bookido-dev',
    publicToken:
        '9v9UCjONSMeMXfAhP5B7hBKoF78Bj6plNiUJ6bq6GRuXpmYRFTlxbdgK4oMpybnB',
    useHttps: true,
  );

  try {
    final request = RecommendItemsToItem(
      itemId: '1',
      targetUserId: '1',
      count: 1,
    );
    final reponse = await client.send(request);
    print(reponse);
    print(reponse.recomms.first);
  } on RecombeResponseException catch (e) {
    print(e.toString());
  }
}
