import 'package:flutter/material.dart';
import 'package:organizador_de_series/_comuns/MyColors.dart';
import 'package:organizador_de_series/models/serie.dart';

class SerieItem extends StatelessWidget {
  final Serie serie;

  const SerieItem({
    super.key,
    required this.serie, // 🔹 obrigatória
  });

  @override
  Widget build(BuildContext context) {
    final progesso = serie.episodiosAssistidos / serie.totalEpisodios;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(padding:   const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
        // Imagem da série
        [
          Container(
            width: 60,
            height: 90,
            decoration: BoxDecoration(
              color: MyColors.lightGreen,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 12,),

          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título da série
               Text(serie.nome, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 8,),
          const SizedBox(width: 4,),
          // Detalhes da série
           Text("Temp: ${serie.temporadaAtual} - Ep: ${serie.episodiosAssistidos}/${serie.totalEpisodios}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(width: 8,),
          // status da serie
          const Text("Assistido", style: TextStyle(fontSize: 16, color: Colors.green),),
          // barra de progresso
          LinearProgressIndicator(
            value: progesso,
            color: MyColors.DarkBlue,
            backgroundColor: MyColors.MediunGrey,
            minHeight: 4,
          ),
            ],
          ))
        ],
      ),
    )
    );
  }
}