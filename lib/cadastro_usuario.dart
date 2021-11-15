import 'package:app_conheca/components/components.dart';
import 'package:app_conheca/entities/usuario.dart';
import 'package:app_conheca/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroUsuario extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  Usuario dadosUsuario = Usuario();

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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nome",
                      ),
                      onSaved: (value) => this.dadosUsuario.nome = value,
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
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Sobrenome",
                      ),
                      onSaved: (value) => this.dadosUsuario.sobrenome = value,
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nova senha",
                ),
                onSaved: (value) => this.dadosUsuario.senha = value,
                validator: (value) {
                  if (value!.length == 0) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "E-mail",
                ),
                onSaved: (value) => this.dadosUsuario.email = value,
                validator: (value) {
                  if (value!.length == 0) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Data de nascimento",
                      ),
                      onSaved: (value) =>
                          this.dadosUsuario.dataNascimento = value,
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
                // Flexible(
                //   child: CaixaDeTexto("Mês", false),
                // ),
                // Flexible(
                //   child: CaixaDeTexto("Ano", false),
                // ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: "Status",
            //     ),
            //     onSaved: (value) => this.dadosUsuario.status = value,
            //     validator: (value) {
            //       if (value!.length == 0) {
            //         return "Campo obrigatório";
            //       }
            //       return null;
            //     },
            //     autovalidateMode: AutovalidateMode.onUserInteraction,
            //   ),
            // ),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      var usuario = Usuario(
                          nome: dadosUsuario.nome,
                          sobrenome: dadosUsuario.sobrenome,
                          senha: dadosUsuario.senha,
                          email: dadosUsuario.email,
                          dataNascimento: dadosUsuario.dataNascimento);
                      var service =
                          Provider.of<UsuarioService>(context, listen: false);
                      service.create(usuario);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Dados processados com sucesso'),
                        ),
                      );
                      Navigator.of(context).pushReplacementNamed('/principal');
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
