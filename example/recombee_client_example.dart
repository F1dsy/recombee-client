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

    print(await client.send(request));
  } on RecombeResponseException catch (e) {
    print(e.toString());
  }
}
