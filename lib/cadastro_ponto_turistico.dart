import 'package:app_conheca/components/components.dart';
import 'package:app_conheca/entities/categoria.dart';
import 'package:app_conheca/entities/ponto_turistico.dart';
import 'package:app_conheca/services/categoria_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroPontoTuristico extends StatefulWidget {
  @override
  _CadastroPontoTuristicoState createState() => _CadastroPontoTuristicoState();
}

class _CadastroPontoTuristicoState extends State<CadastroPontoTuristico> {
  var _formKey = GlobalKey<FormState>();
  PontoTuristico ponto = PontoTuristico();
  Categoria itemSelecionado = Categoria(id: 2);

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
        title: Text("Cadastro de ponto turístico"),
        actions: [],
        backgroundColor: Colors.lightGreen[900],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // DropDownButton para escolher a categoria
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        child: Consumer<CategoriaService>(
                            builder: (context, service, child) {
                          List<Categoria> lista = service.categorias;
                          return DropdownButtonHideUnderline(
                            child: DropdownButton(
                              onChanged: (value) {
                                setState(() {
                                  // Método 1
                                  // for (var c in service.categorias) {
                                  //   if (c.id == value) {
                                  //     itemSelecionado = c;
                                  //     break;
                                  //   }
                                  // }
                                  // Método 2
                                  // itemSelecionado = service.categorias
                                  //     .where((c) => c.id == value)
                                  //     .toList()[0];
                                  // print(itemSelecionado.tipo);
                                  //Método 3
                                  itemSelecionado = service.categorias
                                      .firstWhere((c) => c.id == value);
                                });
                              },
                              value: itemSelecionado.id,
                              items: lista.map((c) {
                                return DropdownMenuItem(
                                  value: c.id,
                                  child: Text(c.tipo!),
                                );
                              }).toList(),
                            ),
                          );
                        }),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 65,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/cadastroCategoria');
                        },
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
              // Caixas de texto para nome e endereço
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Defina um nome",
                  ),
                  onSaved: (value) => this.ponto.nome = value,
                  validator: (value) {
                    if (value!.length == 0) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),

              // TextField para inserção de coordenada
              // Center(
              //   child: Row(
              //     children: [
              //       Flexible(
              //         child: CaixaDeTexto("Coordenada", false),
              //       ),
              //       Container(
              //         height: 65,
              //         width: 65,
              //         child: IconButton(
              //           onPressed: () {},
              //           icon: Icon(
              //             Icons.map,
              //             size: 50,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Descrição do ponto turístico
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    "Descrição",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 5,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              // Caixa de exibição e inserção de imagens
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    "Imagens",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  child: Card(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: [
                        CardImagem('images/avenida_paulista.jpg'),
                        CardImagem('images/centro_historico_paraty.jpg'),
                        CardImagem('images/baia_sancho.jpg'),
                        CardImagem('images/centro_historico_porto_seguro.jpg'),
                        CardImagem('images/cristo_redentor.jpg'),
                        CardImagem('images/elevador_lacerda.jpg'),
                        CardImagem('images/ibirapuera.jpg'),
                        CardImagem('images/ilha_grande.jpg'),
                      ],
                    ),
                  ),
                ),
              ),
              // Botões para inserir e cancelar a inserção de imagens
              Row(
                children: [
                  Flexible(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(16.0, 1.0, 16.0, 16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen[900],
                        ),
                        child: Text(
                          "Add Imagens",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(16.0, 1.0, 16.0, 16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen[900],
                        ),
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              // Botão para cadastrar o ponto turístico
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
                      "Cadastrar",
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
        ),
      ),
    );
  }
}
