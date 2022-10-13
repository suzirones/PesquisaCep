import 'package:pesquisa_cep/widgets/CampoEntrada.dart';
import 'package:pesquisa_cep/widgets/EspacoEntreElemento.dart';
import "package:flutter/material.dart";

import '../modelo/ViaCepService.dart';

class ViewHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EstadoWidget();
  }
}

class EstadoWidget extends State<ViewHome> {
  Text _campoSaida = new Text("");
  CampoEntrada _campoEntradaCep = new CampoEntrada("CEP", 22.0);

  Future _pesquisar() async {
    try {
      final resultadosCep =
          await ViaCepService.fetchCep(cep: _campoEntradaCep.controller.text);

      String resultado = "";
      resultado += "Cep: " + resultadosCep.cep + "\n";
      resultado += "Logradouro: " + resultadosCep.logradouro + "\n";
      resultado += "Complemento: " + resultadosCep.complemento + "\n";
      resultado += "Bairro: " + resultadosCep.bairro + "\n";
      resultado += "Localidade: " + resultadosCep.localidade + "\n";
      resultado += "UF: " + resultadosCep.uf + "\n";
      resultado += "Ibge: " + resultadosCep.ibge + "\n";

      setState(() {
        _campoSaida = new Text(
          resultado,
          style: TextStyle(fontSize: 22.0),
        );
      });
    } catch (_) {
      setState(() {
        _campoSaida = new Text(
          "Não encontrado!",
          style: TextStyle(fontSize: 22.0),
        );
      });
    }
  }

  void _limpar() {
    setState(() {
      _campoSaida = new Text("");
      _campoEntradaCep.controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        EspacoEntreElemento(0, 10),
        _campoEntradaCep,
        EspacoEntreElemento(0, 10),
        TextButton(
          child: Text(
            "Pesquisar",
            style: TextStyle(fontSize: 22.0),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 28, 184, 33),
            primary: Colors.black,
            padding: EdgeInsets.all(10.0),
          ),
          onPressed: () {
            _pesquisar();
          },
        ),
        EspacoEntreElemento(0, 10),
        TextButton(
          child: Text(
            "Limpar",
            style: TextStyle(fontSize: 22.0),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
            primary: Colors.black,
            padding: EdgeInsets.all(10.0),
          ),
          onPressed: () {
            _limpar();
          },
        ),
        EspacoEntreElemento(0, 20),
        _campoSaida,
      ],
    );
  }
}
