import 'package:recombee_client/src/bindings/recombee_response.dart';
import 'package:recombee_client/src/bindings/recommendation.dart';

class RecommendationResponse extends RecombeeResponse {
  RecommendationResponse({
    required this.recommId,
    required this.recomms,
    this.numberNextRecommsCalls,
    this.abGroup,
  });

  /// recommId Id of the recommendation request
  final String recommId;

  /// Obtained recommendations
  final List<Recommendation> recomms;

  /// How many times *Recommend Next Items* have been called for this `recommId`
  final int? numberNextRecommsCalls;

  /// Name of AB-testing group to which the request belongs if there is a custom AB-testing running.
  final String? abGroup;

  factory RecommendationResponse.fromJson(Map<String, dynamic> json) {
    return RecommendationResponse(
      recommId: json['recommId'],
      recomms: List<Recommendation>.from(
          json['recomms'].map((x) => Recommendation.fromJson(x))),
      numberNextRecommsCalls: json['numberNextRecommsCalls'],
      abGroup: json['abGroup'],
    );
  }
}
