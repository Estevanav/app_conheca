import 'package:app_conheca/components/cardHomeList.dart';
import 'package:app_conheca/components/components.dart';
import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  var meuItemInicial = 'Tudo';

  List<String> meusItens = [
    'Tudo',
    'Restaurantes',
    'Hotéis',
    'Internacionais',
    'Beleza natural',
    'Urbano'
  ];

  late int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) {
        Navigator.of(context).pushReplacementNamed('/login');
      } else if (index == 1) {
        Navigator.of(context).pushReplacementNamed('/cadastroPonto');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // ---------------------------- AppBar -------------

        appBar: AppBar(
          toolbarHeight: 65,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  onChanged: (value) {
                    setState(() {
                      meuItemInicial = value.toString();
                    });
                  },
                  value: meuItemInicial,
                  items: meusItens.map((itens) {
                    return DropdownMenuItem(
                      value: itens,
                      child: Text(itens),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              tooltip: 'Configurações',
              onPressed: () {
                Navigator.of(context).pushNamed('/configuracoes');
              },
            ),
          ],
          backgroundColor: Colors.lightGreen[900],
        ),

        // ---------------------------- Body -------------

        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),                    
                    labelText: 'Pesquise aqui seu ponto turístico',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 12,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: cardHomeList,
              ),
            ),
          ],
        ),

        // ---------------------------- BottomNavigationBar -------------

        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.lightGreen[900],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Novo local',
              backgroundColor: Colors.lightGreen[900],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Mapa',
              backgroundColor: Colors.lightGreen[900],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
              backgroundColor: Colors.lightGreen[900],
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
