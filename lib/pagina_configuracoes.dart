import 'package:app_conheca/app.dart';
import 'package:app_conheca/components/components.dart';
import 'package:flutter/material.dart';

class PaginaConfiguracoes extends StatefulWidget {
  @override
  _PaginaConfiguracoesState createState() => _PaginaConfiguracoesState();
}

class _PaginaConfiguracoesState extends State<PaginaConfiguracoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        backgroundColor: Colors.lightGreen[900],
      ),
      body: Column(
        children: [          
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomSwitch(),
              ),
              Text(
                'Tema escuro',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
