class ProductModal {
  final String name;
  final String detail;
  final String path;
  final String price;
  ProductModal({
    this.name,
    this.detail,
    this.path,
    this.price,
  });

  ProductModal copyWith({String name, String detail, String path, String price}) {
    return ProductModal(
      name: name ?? this.name,
      detail: detail ?? this.detail,
      path: path ?? this.path,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'detail': detail,
      'path': path,
      'price':price,
    };
  }

  factory ProductModal.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return ProductModal(
      name: map['name'],
      detail: map['detail'],
      path: map['path'],
      price: map['price'],
    );
  }
}
