import 'package:flutter/material.dart';

class Anomalia {
  final String descricao;

  Anomalia(this.descricao);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeGuard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF1C1C1C),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {

  final List<Anomalia> anomalias = [
    Anomalia('Anomalia 1: Atividade suspeita detectada as 18:30!'),
    Anomalia('Anomalia 2: Download não autorizado interrompido "WhatsApp2.exe"'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
        appBar: AppBar(
          title: Text('Bem vindo ao SafeGuard', style: TextStyle(color:Colors.white)),
          backgroundColor: Color(0xFF1C1C1C)
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 32, 232, 236)),
                onPressed: () {
                  //Aqui será onde a lógica para o desligamento do monitoramento vai ser aplicada
                },
                child: Text('Ativar/Desativar monitoramento', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 20),
              Text('Lista de Anomalias:', style: TextStyle(color: Colors.white)),

              Expanded(
                child: ListView.builder(
                itemCount: anomalias.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      anomalias[index].descricao,
                      style: TextStyle(color: Colors.white)),
                    
                    
                  );
                },
              ),
            ),
          ],
         ),
       ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          },
          tooltip: 'Configurações',
          child: Icon(Icons.settings),
        ),
    );
  }
}
class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //BOTÕES PARA OPÇÃO DE MONITORAMENTO
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor:  const Color.fromARGB(255, 32, 232, 236)
            ),
            onPressed: () {
              //LOGICA PARA O MONITORAMENTO DE DOWNLOADS
            },
          child: Text('Monitorar Downloads', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); //VOLTA PARA A TELA PRINCIPAL
            },
            child: Text('Voltar',)
          ),
        ],
      ),
    ),
    );
  }
}