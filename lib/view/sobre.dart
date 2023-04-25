import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Projeto de Monitoramento de Alimentos para Geladeira',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Este aplicativo tem como objetivo evitar o desperdício de alimentos, fornecendo informações precisas sobre o estado de estoque dos produtos. Além disso, a lista de compras integrada e as dicas de armazenamento ajudam os usuários a prolongar a vida útil dos alimentos e economizar dinheiro.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/fotodesenvolvedor.png'),
            ),
            SizedBox(height: 10),
            Text(
              'Desenvolvido por: Lucas Biunessa Mariano',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Email: lucas.mariano@sou.unaerp.edu.br',
            ),
            SizedBox(height: 5),
            Text(
              'GitHub: github.com/lucky800',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1, color: Colors.grey)),
        ),
        child: TextButton(
          onPressed: () => {},
          child: Text(
            'Termos de uso',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
