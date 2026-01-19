import 'package:flutter/material.dart';
import 'package:organizador_de_series/_comuns/MyColors.dart';
import 'package:organizador_de_series/widgets/serie_item.dart';
import 'package:organizador_de_series/models/serie.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  int _currentIndex = 0;

 
  // Tudo que for adicionado entra aqui
  final List<Serie> _series = [];

  // Simula o usuário adicionando uma série
  void _adicionarSerie() {
    setState(() {
      _series.add(
        Serie(
          nome: 'Nova Série',
          temporadaAtual: 1,
          episodiosAssistidos: 3,
          totalEpisodios: 10,
          status: 'Em andamento',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.MediunGrey,
      body: _currentIndex == 0 ? ListView(
        children: _series
                  .map((serie) => SerieItem(serie: serie))
                  .toList(),
          
        
      ): Center(
        child: Text(
          _currentIndex == 0 ? 'Tela Series' :
          _currentIndex == 1 ? 'Tela Filmes' :
          'Tela Adicionar', style: TextStyle(fontSize: 24),
          ),
      ), 
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MyColors.DarkBlue,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
            if(index == 2){
              _adicionarSerie();
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            
            icon: Icon(Icons.tv,),
            label: 'Séries'
            ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Filmes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar',
          ),
        ],
      ),
      );
}
}