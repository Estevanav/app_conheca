import 'package:app_conheca/components/components.dart';
import 'package:flutter/material.dart';

class CadastroUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/principal');
          },
        ),
        title: Text("Cadastro de usuário"),
        actions: [],
        backgroundColor: Colors.lightGreen[900],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: CaixaDeTexto("Nome", false),
              ),
              Flexible(
                flex: 1,
                child: CaixaDeTexto("Sobrenome", false),
              ),
            ],
          ),
          CaixaDeTexto("Nova senha", true),
          CaixaDeTexto("E-mail", false),          
          Padding(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: Container(
              width: double.infinity,
              child: Text(
                "Data de nascimento",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: CaixaDeTexto("Dia", false),
              ),
              Flexible(
                flex: 1,
                child: CaixaDeTexto("Mês", false),
              ),
              Flexible(
                flex: 1,
                child: CaixaDeTexto("Ano", false),
              ),
            ],
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
                  "Cadastrar-se",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
