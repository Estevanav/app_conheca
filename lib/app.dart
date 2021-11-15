import 'package:app_conheca/app_controller.dart';
import 'package:app_conheca/cadastro_categoria.dart';
import 'package:app_conheca/cadastro_ponto_turistico.dart';
import 'package:app_conheca/cadastro_usuario.dart';
import 'package:app_conheca/pagina_configuracoes.dart';
import 'package:app_conheca/pagina_login.dart';
import 'package:app_conheca/pagina_principal.dart';
import 'package:app_conheca/services/categoria_service.dart';
import 'package:app_conheca/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoriaService()),
        ChangeNotifierProvider(create: (context) => UsuarioService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //primarySwatch: Colors.green,
          brightness: AppController.instance.isDarkTheme
              ? Brightness.dark
              : Brightness.light,
        ),
        home: PaginaPrincipal(),
        routes: {
          '/login': (context) => PaginaLogin(),
          '/cadastroUsuario': (context) => CadastroUsuario(),
          '/cadastroPonto': (context) => CadastroPontoTuristico(),
          '/cadastroCategoria': (context) => CadastroCategoria(),
          '/principal': (context) => PaginaPrincipal(),
          '/configuracoes': (context) => PaginaConfiguracoes(),
        },
      ),
    );
  }
}
