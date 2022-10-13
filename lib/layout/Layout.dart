import "package:flutter/material.dart";

class Layout extends StatelessWidget {
  String _tituloDoAPlicativo;

  Widget _viewHome;

  Layout(this._tituloDoAPlicativo, this._viewHome);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _tituloDoAPlicativo,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_tituloDoAPlicativo),
        ),
        body: _viewHome,
      ),
    );
  }
}
