import 'package:flutter/material.dart';
import 'package:projeto_geladeira/view/login.dart';
import 'package:projeto_geladeira/view/sobre.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Map<String, dynamic>> produtos = [
    {'nome': 'Maçã', 'quantidade': 2, 'dia_compra': '21/04/2023'},
    {'nome': 'Banana', 'quantidade': 3, 'dia_compra': '20/04/2023'},
    {'nome': 'Leite', 'quantidade': 1, 'dia_compra': '19/04/2023'}
  ];

  List<Map<String, dynamic>> _geladeiras = [
    {'nome': 'Geladeira 1'},
  ];

  int _currentIndex = 0;

  void adicionarProduto() {
    setState(() {
      produtos.add({
        'nome': 'Novo Produto',
        'quantidade': 1,
        'dia_compra': '23/04/2023'
      });
    });
  }

  void mudarGeladeira(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void adicionarGeladeira() {
    setState(() {
      // Cria um novo índice com base no número atual de itens na lista de geladeiras
      int newIndex = _geladeiras.length + 1;
      // Adiciona a nova geladeira à lista
      _geladeiras.add({'nome': 'Geladeira $newIndex'});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projeto Geladeira'),
        // centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 50, // Aqui você pode ajustar a altura do DrawerHeader
              child: DrawerHeader(
                child: Center(
                  child: Text(
                    'Menu',
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 0, 154, 226)),
                padding: EdgeInsets.zero,
              ),
            ),
            ListTile(
              title: Text('Sobre'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SobrePage()),
                )
              },
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => loginPage()),
                )
              },
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(produtos[index]['nome']),
              subtitle: Text(
                  'Quantidade: ${produtos[index]['quantidade']} | Comprado em: ${produtos[index]['dia_compra']}'),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          for (int i = 0; i < _geladeiras.length; i++)
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen),
              label: 'Geladeira ${i + 1}',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          if (index == _geladeiras.length) {
            adicionarGeladeira();
          } else {
            mudarGeladeira(index);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: adicionarProduto,
        child: Icon(Icons.add),
      ),
    );
  }
}
