class RegisterParams {
  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.whatsapp,
    required this.sexo,
    required this.tipoUsuario,
    required this.dataNascimento,
  });
  late final String name;
  late final String email;
  late final String password;
  late final String whatsapp;
  late final String sexo;
  late final String tipoUsuario;
  late final String dataNascimento;

  RegisterParams.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    whatsapp = json['whatsapp'];
    sexo = json['sexo'];
    tipoUsuario = json['tipoUsuario'];
    dataNascimento = json['dataNascimento'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['password'] = password;
    _data['whatsapp'] = whatsapp;
    _data['sexo'] = sexo;
    _data['tipoUsuario'] = tipoUsuario;
    _data['dataNascimento'] = dataNascimento;
    return _data;
  }
}
