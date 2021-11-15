import 'package:app_conheca/entities/categoria.dart';
import 'package:app_conheca/services/categoria_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroCategoria extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  String? tipo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/cadastroPonto');
          },
        ),
        title: Text("Cadastro de Categoria"),
        actions: [],
        backgroundColor: Colors.lightGreen[900],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite aqui a categoria",
                ),
                onSaved: (value) => this.tipo = value,
                validator: (value) {
                  if (value!.length == 0) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen[900],
                ),
                child: Text(
                  "Cadastrar categoria",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    var categoria = Categoria(tipo: tipo!);
                    var service =
                        Provider.of<CategoriaService>(context, listen: false);
                    service.create(categoria);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Dados processados com sucesso'),
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
