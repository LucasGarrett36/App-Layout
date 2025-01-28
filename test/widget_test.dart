import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout Responsivo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {
              return _buildSmallScreen(context);
            } else if (constraints.maxWidth < 1200) {
              return _buildMediumScreen(context);
            } else {
              return _buildLargeScreen(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildSmallScreen(BuildContext context) {
    return Center(
      child: _buildCard(
        context,
        icon: Icons.phone_android,
        title: 'Tela Pequena',
        description: 'Você está em um dispositivo móvel.',
        color: Colors.blue,
      ),
    );
  }

  Widget _buildMediumScreen(BuildContext context) {
    return Center(
      child: _buildCard(
        context,
        icon: Icons.tablet,
        title: 'Tela Média',
        description: 'Você está em um tablet ou tela intermediária.',
        color: Colors.green,
      ),
    );
  }

  Widget _buildLargeScreen(BuildContext context) {
    return Center(
      child: _buildCard(
        context,
        icon: Icons.desktop_windows,
        title: 'Tela Grande',
        description: 'Você está em um desktop ou tela ampla.',
        color: Colors.red,
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String description,
      required Color color}) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 300,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 100, color: color),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Bem-vindo à $title!'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Saiba mais'),
            ),
          ],
        ),
      ),
    );
  }
}

