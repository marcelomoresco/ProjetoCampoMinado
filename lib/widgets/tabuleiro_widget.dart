// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:acmpo_minado/widgets/campo_widget.dart';
import 'package:flutter/material.dart';

import 'package:acmpo_minado/models/tabuleiro_class.dart';

import '../models/campo_class.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlterarMarcacao;

  const TabuleiroWidget({
    Key? key,
    required this.tabuleiro,
    required this.onAbrir,
    required this.onAlterarMarcacao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map((campo) {
          return CampoWidget(
            campo: campo,
            onAbrir: onAbrir,
            onAlterarMarcacao: onAlterarMarcacao,
          );
        }).toList(),
      ),
    );
  }
}
