class LoginParams {
  LoginParams({
    required this.identifier,
    required this.password,
  });
  late final String identifier;
  late final String password;

  LoginParams.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['identifier'] = identifier;
    _data['password'] = password;
    return _data;
  }
}
