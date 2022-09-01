// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/campo_class.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlterarMarcacao;

  CampoWidget({
    Key? key,
    required this.campo,
    required this.onAbrir,
    required this.onAlterarMarcacao,
  }) : super(key: key);

  Widget _getContent() {
    int qtdMinas = campo.qtdeMinasNaVizinhaca;

    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (campo.aberto && qtdMinas > 0) {
      return Image.asset("assets/images/aberto_$qtdMinas.jpeg");
    } else if (campo.aberto) {
      return Image.asset("assets/images/aberto_0.jpeg");
    } else if (campo.marcado) {
      return Image.asset("assets/images/bandeira.jpeg");
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlterarMarcacao(campo),
      child: _getContent(),
    );
  }
}
