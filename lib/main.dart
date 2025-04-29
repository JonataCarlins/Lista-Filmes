import 'package:flutter/material.dart';

void main() {
  runApp(ListFilmes());
}

class ListFilmes extends StatefulWidget {
  const ListFilmes({super.key});

  @override
  State<ListFilmes> createState() => _ListFilmesState();
}

class _ListFilmesState extends State<ListFilmes> {

  final  _editorController = TextEditingController();
  List <String> filmes = ['Homem Aranha', 'Capitão América'];

  List <String> excluidos = [''];

  void adicionarFilme() {
    setState(() {
      filmes.add(_editorController.text);
      _editorController.clear();
    });
  }

  void excluirFilmes(){
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
            title: Text('Filmes'),
            backgroundColor: Colors.blueAccent),
        body: SafeArea(
          child: Column(
            children: [
              Text(
                  'Filmes adicionados recentemente',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: filmes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filmes[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 58.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _editorController,
                        decoration: InputDecoration(
                          hintText: 'Deseja adicionar algum filme na lista?',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.blue),
                      onPressed: adicionarFilme,
                      tooltip: 'Adicionar filme',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
