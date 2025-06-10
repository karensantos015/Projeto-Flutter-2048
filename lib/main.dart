import 'package:flutter/material.dart';


void main() {
  runApp(Jogo2048App());
}


class Jogo2048App extends StatelessWidget{
 const Jogo2048App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo 2048',
      home: Jogo2048Screen(),
    );
  }
}

class Jogo2048Screen extends StatelessWidget{
  const Jogo2048Screen({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp( title: '2048', home: HomePage());
  }
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.amber.shade50,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '2048',
              style: TextStyle(
                fontFamily: 'Bungee',
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent.shade100,
              ),
            ),


            const SizedBox(height: 80),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

              criarBotaoNivel(context, 4, Colors.amberAccent.shade200, 'Fácil'),
              criarBotaoNivel(context, 5, Colors.pink.shade400, 'Médio'),
              criarBotaoNivel(context, 6, Colors.deepOrangeAccent.shade700, 'Difícil'),
                         ],
              ),

        ],
        ),
      ),
    );
  }

  Widget criarBotaoNivel(BuildContext context, int gridSize, Color cor, String nivelTexto){
    return Padding(
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          backgroundColor: cor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed:()=> _iniciarJogo(context, gridSize, nivelTexto),
        child: Text(
          nivelTexto,
          style: TextStyle(
            fontSize: 24,
            color: Colors.amber.shade50,
              fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }



 void _iniciarJogo(BuildContext context, int gridSize, String nivelTexto){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
        (context)=> PaginaJogo(gridSize:gridSize, nivelTexto:nivelTexto),
      ),
    );
 }
}

       class PaginaJogo extends StatefulWidget{
           final int gridSize;
           final String nivelTexto;

           const PaginaJogo({
             super.key,
             required this.gridSize,
             required this.nivelTexto,
       });
           @override
         State<PaginaJogo> createState() =>_PaginaJogoState();
       }

       class _PaginaJogoState extends State<PaginaJogo>{
               Widget criarBotaoMove(BuildContext context, IconData icone){
                 return Container(
                   height: 70,
                   width: 70,
                   padding: EdgeInsets.all(8),
                   decoration: BoxDecoration(
                       color: Colors.black,
                     border:Border.all(color:  Colors.white, width: 3),
                     borderRadius: BorderRadius.circular(8),
                   ),
                   alignment: Alignment.center,
                   child: Icon( icone, size: 36, color: Colors.deepOrangeAccent.shade100),
                 );
               }

               @override
               Widget build(BuildContext context) {
                 return Scaffold(
                   backgroundColor: Colors.amber.shade50,
                   appBar: AppBar(
                     title: Text(
                       widget.nivelTexto,
                       style: TextStyle(
                         color: Colors.blueGrey.shade600,
                         fontFamily: 'Montserrat.bold',
                       ),
                     ),
                     backgroundColor: Colors.amber.shade50,
                   ),
                   body: Padding(
                     padding: EdgeInsets.all(16),
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Expanded(
                               child: Container(
                                 height: 60,
                                 padding: EdgeInsets.all(12),
                                 decoration: BoxDecoration(
                                   color: Colors.deepOrange.shade200,
                                   border: Border.all(
                                     color: Colors.deepOrange.shade800,
                                     width: 3,
                                   ),
                                   borderRadius: BorderRadius.circular(8),
                                 ),
                                 alignment: Alignment.center,
                                 child: Text(
                                   'Movimentos: ',
                                   style: TextStyle(
                                     fontSize: 24,
                                     color: Colors.deepOrange.shade800,
                                     fontFamily: 'Montserrat',
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 80),

                         SizedBox(
                           height: 500,
                           child: GridView.builder(
                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: widget.gridSize,
                             ),
                             itemBuilder:
                                 (context, index) => Container(
                               margin: const EdgeInsets.all(2),
                               decoration: BoxDecoration(
                                 color: Colors.pink.shade200,
                                 borderRadius: BorderRadius.circular(8),
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey.withOpacity(0.3),
                                     blurRadius: 4,
                                     offset: Offset(2, 2),
                                   ),
                                 ],
                               ),
                               child: const Center(
                                 child: Text(
                                   '2',
                                   style: TextStyle(
                                     color: Colors.pinkAccent,
                                     fontSize: 24,
                                     fontFamily: 'RobotoCondensed',
                                   ),
                                 ),
                               ),
                             ),
                             itemCount: widget.gridSize * widget.gridSize,
                           ),
                         ),

                         SizedBox(height: 20),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             criarBotaoMove(context, Icons.arrow_back),
                             SizedBox(width: 10),
                             criarBotaoMove(context, Icons.arrow_forward),
                             SizedBox(width: 10),
                             criarBotaoMove(context, Icons.arrow_upward),
                             SizedBox(width: 10),
                             criarBotaoMove(context, Icons.arrow_downward),
                           ],
                         ),
                       ],
                     ),
                   ),
                 );
               }







       }

