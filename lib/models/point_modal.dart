class AddMinPointModal {
  final String Productpoint;
  AddMinPointModal({
    this.Productpoint,

  });

  AddMinPointModal copyWith({String Productpoint,}) {
    return AddMinPointModal(
      Productpoint: Productpoint ?? this.Productpoint,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Productpoint': Productpoint,
    };
  }

  factory AddMinPointModal.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return AddMinPointModal(
      Productpoint: map['Productpoint'],
    );
  }
}