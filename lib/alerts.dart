import 'package:flutter/material.dart';

void mostrarAvisoAdicionado(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          style: TextStyle(color: Colors.red, fontSize: 18),
          'Seu filme foi adicionado com sucesso!',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

void mostrarAvisoEcluido(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          style: TextStyle(color: Colors.red, fontSize: 18),
          'Seu filme foi excluido com sucesso!',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

void mostrarAvisoCampoVazio(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          style: TextStyle(color: Colors.red, fontSize: 18),
          'Seu campo esta vazio! \nPor favor adicione um filme!',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}