import "package:flutter/material.dart";

class EspacoEntreElemento extends StatelessWidget {
  EspacoEntreElemento(this._largura, this._altura);

  double _largura = 0;
  double _altura = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _largura,
      height: _altura,
    );
  }
}
