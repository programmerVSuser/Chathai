class AddminModal {
  final String email;
  final String passwort;
  AddminModal({
    this.email,
    this.passwort,
  });

  AddminModal copyWith({String email, String passwort,}) {
    return AddminModal(
      email: email ?? this.email,
      passwort: passwort ?? this.passwort,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'passwort': passwort,
    };
  }

  factory AddminModal.fromMapAddmin(Map<String, dynamic> map) {
    if (map == null) return null;
    return AddminModal(
      email: map['email'],
      passwort: map['passwort'],
    );
  }
}