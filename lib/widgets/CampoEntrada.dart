import "package:flutter/material.dart";

class CampoEntrada extends StatelessWidget {
  CampoEntrada(this._placeHolder, this._tamanhoFonte);

  String _placeHolder = "";
  double _tamanhoFonte = 10;

  TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: _placeHolder,
      ),
      style: TextStyle(fontSize: _tamanhoFonte),
    );
  }
}
