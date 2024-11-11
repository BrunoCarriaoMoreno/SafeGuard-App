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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Anomalia> anomalias = [
    Anomalia('Anomalia 1: Atividade suspeita detectada as 18:30!'),
    Anomalia('Anomalia 2: Download não autorizado interrompido "WhatsApp2.exe"'),
  ];

  bool isMonitoring = false;

  // Função para alternar o estado do monitoramento
  void toggleMonitoring() {
    setState(() {
      isMonitoring = !isMonitoring;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Ajusta a altura do AppBar
        child: Padding(
          padding: const EdgeInsets.only(top: 60), // Move o AppBar para baixo
          child: AppBar(
            automaticallyImplyLeading: false, // Evita o botão de volta automático
            title: Center( // Centraliza o título
              child: Text(
                'Bem-vindo ao SafeGuard',
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: Color(0xFF1C1C1C),
          ),
        ),
      ),
      body: Column(
        children: [
          Spacer(), // O espaço entre o topo e o botão
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 32, 232, 236),
                  minimumSize: Size(double.infinity, 70), // Botão grande
                  textStyle: TextStyle(fontSize: 22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                onPressed: toggleMonitoring, // Chama a função para alternar o estado
                child: Text(
                  isMonitoring
                      ? 'Monitoramento Ativado'
                      : 'Ativar Monitoramento', // Alterna o texto
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(height: 30), // Espaço entre o botão e a lista
          Text('Últimas anomalias reportadas:', style: TextStyle(color: Colors.white)),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 20),
              itemCount: anomalias.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    anomalias[index].descricao,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
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
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 32, 232, 236),
              ),
              onPressed: () {
                //LOGICA PARA O MONITORAMENTO DE DOWNLOADS
              },
              child: Text(
                'Ativar monitoramento de Downloads',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); //VOLTA PARA A TELA PRINCIPAL
              },
              child: Text('Voltar', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
