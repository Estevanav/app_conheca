import 'package:flutter/material.dart';

class PaginaLogin extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<PaginaLogin> {
  String email = '';
  String password = '';

  Widget _body() {
    return Column(
      children: [
        SingleChildScrollView(
          //Supostamente o Material não insere o scroll na tela de login
          child: SizedBox(
            width: MediaQuery.of(context)
                .size
                .width, //faz parte do SigleChieldScrollView
            height: MediaQuery.of(context)
                .size
                .height, //faz parte do SigleChieldScrollView
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 150.0),
                      child: Text(
                        'Conheça!',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            //color: Colors.white.withOpacity(0.5),
                            child: TextField(
                              onChanged: (text) {
                                email = text;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'E-Mail',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            height: 25,
                          ),
                          Container(
                            //color: Colors.white.withOpacity(0.5),
                            child: TextField(
                              onChanged: (text) {
                                password = text;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            height: 25,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (email == 'estevan@gmail.com' &&
                                    password == '123') {
                                  print('Correto');
                                  Navigator.of(context)
                                      .pushReplacementNamed('/principal');
                                } else {
                                  print('Login inválido');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.lightGreen[900],
                              ),
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/cadastroUsuario');
                            },
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 15.0),
                              child: Text(
                                'Não tenho conta, realizar cadastro',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          _body(),
        ],
      ),
    );
  }
}
