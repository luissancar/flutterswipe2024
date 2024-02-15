// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'models/objetos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Aplicación"),
        ),
        body: ListView.builder(
          itemCount: objetos.length,
          itemBuilder: (context, index) {
            final objeto = objetos[index];
            return Dismissible(
              key: Key(objeto.nombre),
              background: Container(
                color: Colors.green,
                child: Align(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Icon(Icons.favorite),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: Align(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(Icons.delete),
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.startToEnd) {
                  setState(() {
                    objetos[index] = objeto.cambiarFavorito(objeto.esFavorito);
                  });
                  return false;
                } else {
                  bool delete = true;
                  final snackbarController =
                      ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Borrardo ${objeto.nombre}'),
                      action: SnackBarAction(
                          label: 'Undo', onPressed: () => delete = false),
                    ),
                  );
                  await snackbarController.closed;
                  return delete;
                }
              },
              onDismissed: (_) {
                setState(() {
                  objetos.removeAt(index);
                });
              },
              child: ListTile(
                title: Text("Objeto " + objeto.nombre),
                trailing: Icon(
                    objeto.esFavorito ? Icons.favorite : Icons.favorite_border),
              ),
            );
          },
        ));
  }
}
