import 'package:flutter/material.dart';
import 'dart:math';

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

class Jogo2048Screen extends StatefulWidget {
  const Jogo2048Screen({super.key});

  @override
  State<Jogo2048Screen> createState() => _Jogo2048ScreenState();
}

class _Jogo2048ScreenState extends State<Jogo2048Screen> {
  int movimentos = 0;

  void _incrementarMovimentos() {
    setState(() {
      movimentos++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      body: SafeArea(
        child: Column(
          children: [

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
                  PlacarMovimentos(movimentos: movimentos),
                ],
              ),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BotaoNivel(
                  cor: Colors.amberAccent.shade200,
                  texto: 'Fácil',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaginaJogo(
                          gridSize: 4,
                          nivelTexto: 'Fácil',
                          onMovimento: _incrementarMovimentos,
                        ),
                      ),
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
                          onMovimento: _incrementarMovimentos,
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
                          onMovimento: _incrementarMovimentos,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),


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

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotaoMovimento(
                    icone: Icons.arrow_upward,
                    onPressed: _incrementarMovimentos,
                  ),
                  const SizedBox(width: 20),
                  BotaoMovimento(
                    icone: Icons.arrow_left,
                    onPressed: _incrementarMovimentos,
                  ),
                  const SizedBox(width: 10),
                  BotaoMovimento(
                    icone: Icons.arrow_right,
                    onPressed: _incrementarMovimentos,
                  ),
                  const SizedBox(width: 20),
                  BotaoMovimento(
                    icone: Icons.arrow_downward,
                    onPressed: _incrementarMovimentos,
                  ),
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
  final int movimentos;

  const PlacarMovimentos({
    super.key,
    required this.movimentos,
  });

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
        'Movimentos: $movimentos',
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
  final VoidCallback onPressed;

  const BotaoMovimento({
    super.key,
    required this.icone,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
      ),
    );
  }
}

class PaginaJogo extends StatefulWidget {
  final int gridSize;
  final String nivelTexto;
  final VoidCallback onMovimento;

  const PaginaJogo({
    super.key,
    required this.gridSize,
    required this.nivelTexto,
    required this.onMovimento,
  });

  @override
  State<PaginaJogo> createState() => _PaginaJogoState();
}

class _PaginaJogoState extends State<PaginaJogo> {
  int movimentos = 0;
  late List<List<int>> grid;
  late int targetValue;
  bool gameOver = false;
  bool gameWon = false;

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  void _initGame() {

    targetValue = widget.gridSize == 4 ? 1024 :
    widget.gridSize == 5 ? 2048 : 4096;


    grid = List.generate(widget.gridSize,
            (_) => List.filled(widget.gridSize, 0));


    _addRandomTile();
    _addRandomTile();
  }

  void _addRandomTile() {
    List<Point> emptyCells = [];


    for (int i = 0; i < widget.gridSize; i++) {
      for (int j = 0; j < widget.gridSize; j++) {
        if (grid[i][j] == 0) {
          emptyCells.add(Point(i, j));
        }
      }
    }

    if (emptyCells.isNotEmpty) {

      Point cell = emptyCells[Random().nextInt(emptyCells.length)];

      grid[cell.x][cell.y] = 1;
    }
  }

  void _moveUp() {
    bool moved = false;

    for (int j = 0; j < widget.gridSize; j++) {
      for (int i = 1; i < widget.gridSize; i++) {
        if (grid[i][j] != 0) {
          int currentRow = i;
          while (currentRow > 0) {
            if (grid[currentRow - 1][j] == 0) {

              grid[currentRow - 1][j] = grid[currentRow][j];
              grid[currentRow][j] = 0;
              currentRow--;
              moved = true;
            } else if (grid[currentRow - 1][j] == grid[currentRow][j]) {

              grid[currentRow - 1][j] += grid[currentRow][j];
              grid[currentRow][j] = 0;
              moved = true;
              break;
            } else {
              break;
            }
          }
        }
      }
    }

    if (moved) {
      _afterMove();
    }
  }

  void _moveDown() {
    bool moved = false;

    for (int j = 0; j < widget.gridSize; j++) {
      for (int i = widget.gridSize - 2; i >= 0; i--) {
        if (grid[i][j] != 0) {
          int currentRow = i;
          while (currentRow < widget.gridSize - 1) {
            if (grid[currentRow + 1][j] == 0) {
              grid[currentRow + 1][j] = grid[currentRow][j];
              grid[currentRow][j] = 0;
              currentRow++;
              moved = true;
            } else if (grid[currentRow + 1][j] == grid[currentRow][j]) {
              grid[currentRow + 1][j] += grid[currentRow][j];
              grid[currentRow][j] = 0;
              moved = true;
              break;
            } else {
              break;
            }
          }
        }
      }
    }

    if (moved) {
      _afterMove();
    }
  }

  void _moveLeft() {
    bool moved = false;

    for (int i = 0; i < widget.gridSize; i++) {
      for (int j = 1; j < widget.gridSize; j++) {
        if (grid[i][j] != 0) {
          int currentCol = j;
          while (currentCol > 0) {
            if (grid[i][currentCol - 1] == 0) {
              grid[i][currentCol - 1] = grid[i][currentCol];
              grid[i][currentCol] = 0;
              currentCol--;
              moved = true;
            } else if (grid[i][currentCol - 1] == grid[i][currentCol]) {
              grid[i][currentCol - 1] += grid[i][currentCol];
              grid[i][currentCol] = 0;
              moved = true;
              break;
            } else {
              break;
            }
          }
        }
      }
    }

    if (moved) {
      _afterMove();
    }
  }

  void _moveRight() {
    bool moved = false;

    for (int i = 0; i < widget.gridSize; i++) {
      for (int j = widget.gridSize - 2; j >= 0; j--) {
        if (grid[i][j] != 0) {
          int currentCol = j;
          while (currentCol < widget.gridSize - 1) {
            if (grid[i][currentCol + 1] == 0) {
              grid[i][currentCol + 1] = grid[i][currentCol];
              grid[i][currentCol] = 0;
              currentCol++;
              moved = true;
            } else if (grid[i][currentCol + 1] == grid[i][currentCol]) {
              grid[i][currentCol + 1] += grid[i][currentCol];
              grid[i][currentCol] = 0;
              moved = true;
              break;
            } else {
              break;
            }
          }
        }
      }
    }

    if (moved) {
      _afterMove();
    }
  }

  void _afterMove() {
    setState(() {
      movimentos++;
      widget.onMovimento();
      _addRandomTile();
      _checkGameStatus();
    });
  }

  void _checkGameStatus() {
    for (int i = 0; i < widget.gridSize; i++) {
      for (int j = 0; j < widget.gridSize; j++) {
        if (grid[i][j] == targetValue) {
          gameWon = true;
          _showGameOverDialog(true);
          return;
        }
      }
    }


    bool hasEmpty = false;
    bool hasValidMoves = false;

    for (int i = 0; i < widget.gridSize; i++) {
      for (int j = 0; j < widget.gridSize; j++) {
        if (grid[i][j] == 0) {
          hasEmpty = true;
        }
        if (i < widget.gridSize - 1 && grid[i][j] == grid[i + 1][j]) {
          hasValidMoves = true;
        }
        if (j < widget.gridSize - 1 && grid[i][j] == grid[i][j + 1]) {
          hasValidMoves = true;
        }
      }
    }

    if (!hasEmpty && !hasValidMoves) {
      gameOver = true;
      _showGameOverDialog(false);
    }

  }

  void _showGameOverDialog(bool won) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: won ? Colors.green.shade400 : Colors.red.shade400,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  won ? Icons.celebration : Icons.sentiment_dissatisfied,
                  size: 60,
                  color: won ? Colors.green.shade400 : Colors.red.shade400,
                ),

                SizedBox(height: 20),
                Text(
                  won ? 'PARABÉNS!' : 'FIM DE JOGO',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: won ? Colors.green.shade700 : Colors.red.shade700,
                    fontFamily: 'Bungee',
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  won
                      ? 'Você alcançou $targetValue!'
                      : 'Não há mais movimentos possíveis.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepOrange.shade800,
                    fontFamily: 'Montserrat',
                  ),
                ),

                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent.shade200,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      child: Text(
                        'Novo Jogo',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _initGame();
                          movimentos = 0;
                          gameOver = false;
                          gameWon = false;
                        });
                      },
                    ),
                    SizedBox(width: 15),
                    if (won)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade300,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        child: Text(
                          'Continuar',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),

                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            gameWon = false;
                          });
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getTileColor(int value) {
    if (value == 0) return Colors.pink.shade200;
    final int index = value.isPowerOfTwo ? (log(value) / log(2)).round() : 0;
    final List<Color> colors = [
      Colors.amber.shade100,
      Colors.amber.shade200,
      Colors.orange.shade200,
      Colors.amber.shade300,
      Colors.orange.shade300,
      Colors.orange.shade400,
      Colors.deepOrange.shade300,
      Colors.deepOrange.shade400,
      Colors.red.shade300,
      Colors.red.shade400,
      Colors.pink.shade300,
      Colors.pink.shade400,
    ];
    return index < colors.length ? colors[index] : colors.last;
  }

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
                color: Colors.deepOrangeAccent.shade100,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
            PlacarMovimentos(movimentos: movimentos),
          ],
        ),
        backgroundColor: Colors.amber.shade50,
      ),
      body: Column(
        children: [

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
                      MaterialPageRoute(
                        builder: (context) => Jogo2048Screen(),
                      ),
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
                          onMovimento: widget.onMovimento,
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
                          onMovimento: widget.onMovimento,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),


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
                  itemBuilder: (context, index) {
                    int row = index ~/ widget.gridSize;
                    int col = index % widget.gridSize;
                    return Container(
                      decoration: BoxDecoration(
                        color: _getTileColor(grid[row][col]),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          grid[row][col] == 0 ? '' : grid[row][col].toString(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: grid[row][col] >= 8 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BotaoMovimento(
                  icone: Icons.arrow_upward,
                  onPressed: _moveUp,
                ),
                const SizedBox(width: 20),
                BotaoMovimento(
                  icone: Icons.arrow_left,
                  onPressed: _moveLeft,
                ),
                const SizedBox(width: 10),
                BotaoMovimento(
                  icone: Icons.arrow_right,
                  onPressed: _moveRight,
                ),
                const SizedBox(width: 20),
                BotaoMovimento(
                  icone: Icons.arrow_downward,
                  onPressed: _moveDown,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Point {
  final int x;
  final int y;

  Point(this.x, this.y);
}

extension PowerOfTwo on int {
  bool get isPowerOfTwo {
    if (this <= 0) return false;
    return (this & (this - 1)) == 0;
  }
}