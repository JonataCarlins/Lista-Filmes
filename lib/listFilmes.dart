import 'package:flutter/material.dart';
import 'alerts.dart';

class ListFilmes extends StatefulWidget {
  const ListFilmes({super.key});

  @override
  State<ListFilmes> createState() => _ListFilmesState();
}

class _ListFilmesState extends State<ListFilmes> {
  final _editorController = TextEditingController();
  List<String> filmes = ['Homem Aranha', 'Capitão América'];

  List<String> excluidos = [''];

  void adicionarFilme() {
    if (_editorController.text.trim().isEmpty) return;

    setState(() {
      filmes.add(_editorController.text);
      _editorController.clear();
    });
  }

  void excluirFilmes() {
    setState(() {
      filmes.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Seus Filmes'),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Text(
                'Filmes ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(color: Colors.black);
                  },
                  padding: EdgeInsets.all(15),
                  itemCount: filmes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.slow_motion_video,
                        color: Colors.blueAccent,
                      ),
                      title: Text(
                        filmes[index],
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          mostrarAvisoEcluido(context);
                          setState(() {
                            filmes.removeAt(index);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 58.0,
                ),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _editorController,
                          decoration: InputDecoration(
                            hintText: 'Deseja adicionar algum filme na lista?',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.red),
                        onPressed: () {
                          if (_editorController.text.trim().isEmpty) {
                            mostrarAvisoCampoVazio(context);
                          } else {
                            mostrarAvisoAdicionado(context);
                            adicionarFilme();
                          }
                        },
                      ),
                    ],
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
