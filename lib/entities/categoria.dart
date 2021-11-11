class Categoria {
  int? id;
  String? tipo;

  Categoria({id, tipo}) {
    this.id = id;
    this.tipo = tipo;
  }

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['id'],
      tipo: json['tipo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"tipo": tipo};
  }
}
