import 'package:app_conheca/app_controller.dart';
import 'package:flutter/material.dart';

class CaixaDeTexto extends StatelessWidget {
  final String titulo;
  final bool valor;

  CaixaDeTexto(this.titulo, this.valor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: valor,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: titulo,
        ),
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDarkTheme,
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}

class CardImagem extends StatelessWidget {
  final String imagem;

  CardImagem(this.imagem);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          image: DecorationImage(
            image: AssetImage(imagem),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
