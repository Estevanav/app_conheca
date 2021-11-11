class Usuario {
  
  int? id;
  String? nome;
  String? sobrenome;
  int? status;
  String? senha;
  String? email;
  DateTime? dataNascimento;

  Usuario({id, nome, sobrenome, status, senha, email, dataNascimento});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nome: json['nome'],
      sobrenome: json['sobrenome'],
      status: json['status'],
      senha: json['senha'],
      email: json['email'],
      dataNascimento: json['dataNascimento'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nome": nome,
      "sobrenome": sobrenome,
      "status": status,
      "senha": senha,
      "email": email,
      "dataNascimento": dataNascimento
    };
  }
}
