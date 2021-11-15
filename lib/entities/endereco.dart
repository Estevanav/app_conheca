class Endereco {
  int? id;
  String? numero;
  String? logradouro;
  String? complemento;
  String? referencia;
  String? cep;
  String? cidade;

  Endereco({id, numero, logradouro, complemento, referencia, cep, cidade}) {
    this.id = id;
    this.numero = numero;
    this.logradouro = logradouro;
    this.complemento = complemento;
    this.referencia = referencia;
    this.cep = cep;
    this.cidade = cidade;
  }

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
      id: json['id'],
      numero: json['numero'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      referencia: json['referencia'],
      cep: json['cep'],
      cidade: json['cidade'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "numero": numero,
      "logradouro": logradouro,
      "complemento": complemento,
      "referencia": referencia,
      "cep": cep,
      "cidade": cidade
    };
  }
}
