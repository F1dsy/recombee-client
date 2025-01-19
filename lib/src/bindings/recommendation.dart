class Recommendation {
  Recommendation(this.id, {this.values});

  /// The identifier of the recommended entity.
  final String id;

  final Map<String, dynamic>? values;

  /// Retrieves the values of properties associated with the recommended entity.
  ///
  /// Returns a map of property names and their values.
  ///
  /// Throws IllegalStateException if the recommendation was not meant to return values
  ///         (this can be controlled using the `returnProperties` parameter in the request).
  Map<String, dynamic> getValues() {
    if (values == null) {
      throw StateError(
          "The request was not meant to return values (use returnProperties parameter)");
    }
    return values!;
  }

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      json['id'],
      values: json['values'],
    );
  }
}
