class ProductpointUser {
  final String point;
  ProductpointUser({
    this.point,
  });

  ProductpointUser copyWith({String point,}) {
    return ProductpointUser(
      point: point ?? this.point,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'point': point,
    };
  }

  factory ProductpointUser.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return ProductpointUser(
      point: map['point'],
    );
  }
}