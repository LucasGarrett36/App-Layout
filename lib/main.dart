import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug para um visual mais limpo
      title: 'Layout Responsivo',
      theme: ThemeData(
        primarySwatch: Colors.green, // Cor verde como solicitado
      ),
      home: const ResponsiveLayout(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Responsivo'),
        backgroundColor: Colors.green, // Definir o AppBar com a cor verde
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return _buildSmallScreen();
          } else if (constraints.maxWidth < 1200) {
            return _buildMediumScreen();
          } else {
            return _buildLargeScreen();
          }
        },
      ),
    );
  }

  // Layout para telas pequenas
  Widget _buildSmallScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.phone_android, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Bem-vindo ao meu primeiro programa',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Talento Tech',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Layout para telas médias
  Widget _buildMediumScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.tablet, size: 150, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Bem-vindo ao meu primeiro programa',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Talento Tech',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Layout para telas grandes
  Widget _buildLargeScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.desktop_windows, size: 200, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Bem-vindo ao meu primeiro programa',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Talento Tech',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
