import 'package:flutter/material.dart';

void main() {
  runApp(Jogo2048App());
}

class Jogo2048App extends StatelessWidget {
  const Jogo2048App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo 2048',
      debugShowCheckedModeBanner: false,
      home: Jogo2048Screen(),
    );
  }
}

class Jogo2048Screen extends StatelessWidget {
  const Jogo2048Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho com título e placar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '2048',
                    style: TextStyle(
                      fontFamily: 'Bungee',
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent.shade100,
                    ),
                  ),
                  const PlacarMovimentos(),
                ],
              ),
            ),

            // Botões de nível
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BotaoNivel(
                  cor: Colors.amberAccent.shade200,
                  texto: 'Fácil',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Jogo2048Screen()),
                    );
                  },
                ),
                const SizedBox(width: 10),
                BotaoNivel(
                  cor: Colors.pink.shade400,
                  texto: 'Médio',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaginaJogo(
                          gridSize: 5,
                          nivelTexto: 'Médio',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 10),
                BotaoNivel(
                  cor: Colors.deepOrangeAccent.shade700,
                  texto: 'Difícil',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaginaJogo(
                          gridSize: 6,
                          nivelTexto: 'Difícil',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

            // Tabuleiro 4x4 com espaço adequado
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: 16,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.pink.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(''),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Botões de movimento (apenas visuais)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotaoMovimento(icone: Icons.arrow_upward),
                  const SizedBox(width: 20),
                  BotaoMovimento(icone: Icons.arrow_left),
                  const SizedBox(width: 10),
                  BotaoMovimento(icone: Icons.arrow_right),
                  const SizedBox(width: 20),
                  BotaoMovimento(icone: Icons.arrow_downward),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlacarMovimentos extends StatelessWidget {
  const PlacarMovimentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.deepOrange.shade200,
        border: Border.all(
          color: Colors.deepOrange.shade800,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Movimentos: 0',
        style: TextStyle(
          fontSize: 16,
          color: Colors.deepOrange.shade800,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}

class BotaoNivel extends StatelessWidget {
  final Color cor;
  final String texto;
  final VoidCallback onPressed;

  const BotaoNivel({
    super.key,
    required this.cor,
    required this.texto,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backgroundColor: cor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 18,
          color: Colors.amber.shade50,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}

class BotaoMovimento extends StatelessWidget {
  final IconData icone;

  const BotaoMovimento({
    super.key,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Icon(
        icone,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}

class PaginaJogo extends StatefulWidget {
  final int gridSize;
  final String nivelTexto;

  const PaginaJogo({
    super.key,
    required this.gridSize,
    required this.nivelTexto,
  });

  @override
  State<PaginaJogo> createState() => _PaginaJogoState();
}

class _PaginaJogoState extends State<PaginaJogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.nivelTexto,
              style: TextStyle(
                color: Colors.blueGrey.shade600,
                fontFamily: 'Montserrat.bold',
              ),
            ),
            const PlacarMovimentos(),
          ],
        ),
        backgroundColor: Colors.amber.shade50,
      ),
      body: Column(
        children: [
          // Botões de nível
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BotaoNivel(
                  cor: Colors.amberAccent.shade200,
                  texto: 'Fácil',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Jogo2048Screen()),
                    );
                  },
                ),
                const SizedBox(width: 10),
                BotaoNivel(
                  cor: Colors.pink.shade400,
                  texto: 'Médio',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaginaJogo(
                          gridSize: 5,
                          nivelTexto: 'Médio',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 10),
                BotaoNivel(
                  cor: Colors.deepOrangeAccent.shade700,
                  texto: 'Difícil',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaginaJogo(
                          gridSize: 6,
                          nivelTexto: 'Difícil',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Tabuleiro
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: AspectRatio(
                aspectRatio: 1,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.gridSize,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: widget.gridSize * widget.gridSize,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: Colors.pink.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(''),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Botões de movimento (apenas visuais)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BotaoMovimento(icone: Icons.arrow_upward),
                const SizedBox(width: 20),
                BotaoMovimento(icone: Icons.arrow_left),
                const SizedBox(width: 10),
                BotaoMovimento(icone: Icons.arrow_right),
                const SizedBox(width: 20),
                BotaoMovimento(icone: Icons.arrow_downward),
              ],
            ),
          ),
        ],
      ),
    );
  }
}