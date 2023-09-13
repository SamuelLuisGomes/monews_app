import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  String? email;
  String? senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*== Logo ==*/
                    Image.asset(
                      'lib/images/logoMonews.png',
                      width: 320,
                      height: 280,
                    ),
                    /*== Campos Usuário e Senha ==*/

                    TextFormField(
                      /*== Criando o Input e adicionando suas características ==*/
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.blueGrey[800]),
                        prefix: Icon(
                          Icons.email,
                          color: Colors.white70,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                      ),
                      onSaved: (value) => email = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo Obrigatório";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: _obscureText,
                      /*== Criando o Input e adicionando suas características ==*/
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.blueGrey[800]),
                        prefix: Icon(
                          Icons.lock,
                          color: Colors.white70,
                        ),
                        suffixIcon: IconButton(
                          icon: _obscureText
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                      ),
                      onSaved: (value) => senha = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo Obrigatório";
                        }
                        if (value.length < 6) {
                          return "Campo dee conter no mínimo 6 caracteres!";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ),
                              );
                            },
                            child: Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    )

                    /*== Botão ==*/
                    /*Redes Sociais*/
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
