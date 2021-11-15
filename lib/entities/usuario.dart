class Usuario {
  int? id;
  String? nome;
  String? sobrenome;
  int? status;
  String? senha;
  String? email;
  String? dataNascimento;

  Usuario({id, nome, sobrenome, status, senha, email, dataNascimento}) {
    this.id = id;
    this.nome = nome;
    this.sobrenome = sobrenome;
    this.senha = senha;
    this.status = status;
    this.email = email;
    this.dataNascimento = dataNascimento;
  }

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
      "nome": nome,
      "sobrenome": sobrenome,
      "senha": senha,
      "email": email,
      "dataNascimento": dataNascimento
    };
  }
}
