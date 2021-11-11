import 'package:flutter/material.dart';

List<Widget> cardHomeList = [
  CustomCardHome('Avenida Paulista', 'São Paulo', 'images/avenida_paulista.jpg'),
  CustomCardHome('Baía do Sancho', 'Pernambuco', 'images/baia_sancho.jpg'),
  CustomCardHome('Centro Histórico de Paraty', 'Rio de Janeiro', 'images/centro_historico_paraty.jpg'),
  CustomCardHome('Centro Histórico de Porto Seguro', 'Bahia', 'images/centro_historico_porto_seguro.jpg'),
  CustomCardHome('Cristo Redentor', 'Rio de Janeiro', 'images/cristo_redentor.jpg'),
  CustomCardHome('Elevador Lacerda', 'Salvador', 'images/elevador_lacerda.jpg'),
  CustomCardHome('Parque Ibirapuera', 'São Paulo', 'images/ibirapuera.jpg'),
  CustomCardHome('Ilha Grande', 'Rio de Janeiro', 'images/ilha_grande.jpg'),
  CustomCardHome('Lago de Furnas', 'Minas Gerais', 'images/lago_furnas.jpg'),
  CustomCardHome('Pão de Açúcar', 'Rio de Janeiro', 'images/pao_de_acucar.jpg'),
  CustomCardHome('Pelourinhos', 'Bahia', 'images/pelourinhos.jpg'),
  CustomCardHome('Centro Histórico de Porto Seguro', 'Bahia', 'images/piscinas_naturais_porto_galinhas.jpg'),
];

class CustomCardHome extends StatelessWidget {
  
  final String nomeLocal;
  final String localizacao;
  final String imagem;

  CustomCardHome(this.nomeLocal, this.localizacao, this.imagem);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                image: DecorationImage(
                  image: AssetImage(imagem),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 6.0),
                      child: Text(
                        nomeLocal,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 6.0),
                      child: Text(
                        localizacao,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
