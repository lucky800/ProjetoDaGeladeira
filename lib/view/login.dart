import 'package:flutter/material.dart';
import 'package:projeto_geladeira/view/cadastrar_usuario.dart';
import 'package:projeto_geladeira/view/home.dart';
import 'package:projeto_geladeira/view/recuperar_senha.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String email = '';
  String senha = '';
  String mensagemErro = ''; // nova variável

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                // alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logoprincipal.png',
                  height: 150,
                  width: 150,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (text) => {email = text},
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (text) => {senha = text},
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecuperarSenhaPage()),
                  );
                },
                child: Text(
                  'Esqueci minha senha',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (email == 'lucas' && senha == '123') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => homePage()),
                    );
                  } else {
                    setState(() {
                      mensagemErro = 'E-mail ou senha incorretos!';
                    });
                  }
                },
                child: const Text('LOGIN'),
              ),
              // novo widget
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CadastroUsuario()),
                  );
                },
                child: const Text('CADASTRAR'),
              ),
              SizedBox(height: 10),
              Text(
                mensagemErro,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
