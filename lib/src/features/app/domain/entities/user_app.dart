class UserApp {
  UserApp({
    this.jwt,
    this.user,
  });
  late final String? jwt;
  late final User? user;

  UserApp.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['jwt'] = jwt;
    _data['user'] = user?.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.username,
    required this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.createdAt,
    this.updatedAt,
    required this.whatsapp,
    required this.sexo,
    required this.tipoUsuario,
    required this.dataNascimento,
  });
  late final int id;
  late final String username;
  late final String email;
  late final String? provider;
  late final bool? confirmed;
  late final bool? blocked;
  late final String? createdAt;
  late final String? updatedAt;
  late final String whatsapp;
  late final String sexo;
  late final String tipoUsuario;
  late final String dataNascimento;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    whatsapp = json['whatsapp'];
    sexo = json['sexo'];
    tipoUsuario = json['tipoUsuario'];
    dataNascimento = json['dataNascimento'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['provider'] = provider;
    _data['confirmed'] = confirmed;
    _data['blocked'] = blocked;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['whatsapp'] = whatsapp;
    _data['sexo'] = sexo;
    _data['tipoUsuario'] = tipoUsuario;
    _data['dataNascimento'] = dataNascimento;
    return _data;
  }
}
